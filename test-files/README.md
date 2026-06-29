# Test files for QA and beta testers

Download the curated tester package (10 sample documents + guide):

**[Document-Renewal-Extractor-Test-Files.zip](Document-Renewal-Extractor-Test-Files.zip)**

| Item | Description |
|------|-------------|
| Zip size | ~20–30 MB (mobile-friendly download) |
| Contents | 3 CSV, 1 XLSX, 6 PDF in `synthetic/`, `realworld/`, and `documents/` |
| Guide | `TESTER-GUIDE.txt` and `TESTER-GUIDE.pdf` inside the zip |

## What's included

These 10 files cover every format and size band testers need:

- **Fast smoke tests** — small synthetic CSV and XLSX
- **Spreadsheet scale** — Cook County, HHS, HUD, and Montgomery County data
- **PDF range** — tiny notice (Free tier), contract PDFs, and one ~12 MB RFP packet

## Quick start for testers

1. Download and unzip the archive on your phone, tablet, or emulator.
2. Open **Document Renewal Extractor** → **Files** → **Browse**.
3. Select one or more files from the unzipped folders.
4. Tap **Extract Deadlines** and review results on the **Results** tab.

CSV and XLSX files require **Pro** or **Pro Max+**. PDFs work on the Free tier.

Full step-by-step instructions, recommended test scenarios, file inventory, and troubleshooting are in **TESTER-GUIDE.pdf** (or `.txt`) inside the zip.

## Rebuilding this package (maintainers)

From this repo:

```powershell
# Edit test-files/included-files.txt or TESTER-GUIDE.txt, then:
python scripts/generate-tester-guide-pdf.py
.\scripts\build-test-files-zip.ps1
```

Source fixtures live in the sibling folder `deadline-renew-testFIles` (not committed here). Edit `included-files.txt` to change which files ship in the zip.
