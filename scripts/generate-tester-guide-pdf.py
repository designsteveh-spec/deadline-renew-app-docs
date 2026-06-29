"""Generate TESTER-GUIDE.pdf from TESTER-GUIDE.txt with readable layout."""

from __future__ import annotations

import re
import sys
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import inch
from reportlab.platypus import Paragraph, SimpleDocTemplate, Spacer


def ascii_safe(text: str) -> str:
    replacements = {
        "\u2014": "-",
        "\u2013": "-",
        "\u2018": "'",
        "\u2019": "'",
        "\u201c": '"',
        "\u201d": '"',
        "\u2026": "...",
    }
    for src, dst in replacements.items():
        text = text.replace(src, dst)
    return text.encode("ascii", "replace").decode("ascii")


def escape_xml(text: str) -> str:
    return (
        text.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


def txt_to_story(text: str) -> list:
    styles = getSampleStyleSheet()
    title = ParagraphStyle(
        "Title",
        parent=styles["Heading1"],
        fontSize=18,
        leading=22,
        textColor=colors.HexColor("#00468C"),
        spaceAfter=10,
    )
    subtitle = ParagraphStyle(
        "Subtitle",
        parent=styles["Heading2"],
        fontSize=13,
        leading=16,
        textColor=colors.HexColor("#00468C"),
        spaceAfter=14,
    )
    section = ParagraphStyle(
        "Section",
        parent=styles["Heading3"],
        fontSize=11,
        leading=14,
        textColor=colors.HexColor("#00468C"),
        spaceBefore=12,
        spaceAfter=6,
        fontName="Helvetica-Bold",
    )
    body = ParagraphStyle(
        "Body",
        parent=styles["Normal"],
        fontSize=10,
        leading=14,
        alignment=TA_LEFT,
        spaceAfter=4,
    )
    bullet = ParagraphStyle(
        "Bullet",
        parent=body,
        leftIndent=14,
        bulletIndent=6,
        spaceAfter=3,
    )

    story: list = []
    story.append(Paragraph("Document Renewal Extractor", title))
    story.append(Paragraph("Test File Package - Tester Guide", subtitle))

    rule = re.compile(r"^-{5,}$")
    skip_prefixes = ("====",)

    for raw_line in text.splitlines():
        line = ascii_safe(raw_line.rstrip())
        if not line or any(line.startswith(p) for p in skip_prefixes):
            continue
        if rule.match(line):
            continue
        if "DOCUMENT RENEWAL EXTRACTOR" in line and "TEST FILE" in line:
            continue

        if line.isupper() and len(line) > 10 and not line.startswith("  "):
            story.append(Paragraph(escape_xml(line), section))
            continue

        if line.lstrip().startswith(("-", "->")) or line.startswith("  "):
            story.append(Paragraph(escape_xml(line.strip()), bullet))
            continue

        story.append(Paragraph(escape_xml(line), body))

    return story


def render(txt_path: Path, pdf_path: Path) -> None:
    text = txt_path.read_text(encoding="utf-8")
    doc = SimpleDocTemplate(
        str(pdf_path),
        pagesize=letter,
        leftMargin=0.85 * inch,
        rightMargin=0.85 * inch,
        topMargin=0.75 * inch,
        bottomMargin=0.75 * inch,
        title="Document Renewal Extractor - Test File Guide",
        author="Document Renewal Extractor",
    )
    story = txt_to_story(text)
    story.append(Spacer(1, 12))
    doc.build(story)


def main() -> int:
    repo_root = Path(__file__).resolve().parent.parent
    txt = repo_root / "test-files" / "TESTER-GUIDE.txt"
    pdf = repo_root / "test-files" / "TESTER-GUIDE.pdf"
    if not txt.exists():
        print(f"Missing {txt}", file=sys.stderr)
        return 1
    render(txt, pdf)
    print(f"Wrote {pdf}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
