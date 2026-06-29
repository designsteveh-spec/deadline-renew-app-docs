# Test files for QA and beta testers

Download the full package (24 sample documents + tester guide):

**[Document-Renewal-Extractor-Test-Files.zip](Document-Renewal-Extractor-Test-Files.zip)**

| Item | Description |
|------|-------------|
| Zip size | ~95 MB (compressed real-world PDFs and spreadsheets) |
| Contents | 7 CSV, 6 XLSX, 11 PDF in `synthetic/`, `realworld/`, and `documents/` |
| Guide | `TESTER-GUIDE.txt` and `TESTER-GUIDE.pdf` inside the zip |

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
# Edit test-files/TESTER-GUIDE.txt if needed, then:
python scripts/generate-tester-guide-pdf.py
.\scripts\build-test-files-zip.ps1
```

Source fixtures live in the sibling folder `deadline-renew-testFIles` (not committed here).
