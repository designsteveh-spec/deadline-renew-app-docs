# Deadline & Renewal Extractor — Privacy Policy

**Last updated:** June 2026

This policy applies to the **Deadline & Renewal Extractor** Android app (also referred to as “Deadline Renew”). The same text is available in the app under **Settings → Privacy Policy**.

## Overview

Deadline & Renewal Extractor is an on-device contract and policy deadline utility. Documents are processed locally using deterministic rules — **no third-party AI or OCR**. This policy explains what data the app uses, why, and your rights — including if you are in the European Economic Area (EEA), United Kingdom, or Switzerland.

## Data controller

The data controller responsible for this app is:

- **Stephen Heidelberg**
- Where applicable, apps are offered through **Naamans Creek Ventures LLC**
- **Privacy contact:** designstehev@gmail.com

We do not operate user accounts or a separate customer website for this app.

## Data we store on your device

The app saves a small amount of information locally using **Android DataStore**:

- **Subscription entitlement** — a local flag indicating which paid plan (if any) Google Play has verified for your Google account
- **Usage counters** — free daily/monthly and paid monthly extraction counts used to enforce plan limits

**Legal basis (GDPR):** processing is necessary for the app to function as you expect (performance of the service / legitimate interest). This data stays on your device and is not uploaded to servers we operate.

## Document processing and local file storage

When you select or import a file (via **Browse**, **Google Drive**, or the Extract screen file picker), the app may:

1. Read the file through Android’s system document picker (Storage Access Framework)
2. Copy the file into the app’s **private storage** (`filesDir`) so it can be used reliably for extraction and listed on the **Files** screen
3. Process text on your device to detect renewal dates, notice periods, and similar obligations

Supported formats: **PDF, DOCX, and TXT** with selectable text.

- Extraction runs **entirely on your device**
- We do **not** receive your documents on our servers
- We do **not** upload file contents to third-party AI, OCR, or analytics services
- Export files (CSV, TXT, ICS) are created on your device; you choose whether and how to share them through other apps

If you delete copied files outside the app (for example via a file manager), the app removes missing entries from its local file list on next launch.

**Legal basis (GDPR):** performance of the service you request (extracting deadlines from documents you choose).

## Google Drive and other document sources

The **Google Drive** button opens Android’s standard document picker starting at Google Drive (when available). You choose which files to grant read access to. The app reads those files once to copy them into private app storage for local use. We do not maintain a persistent connection to your Google account and do not access Drive except when you explicitly pick files through the system UI.

Google may process data under its own terms when you use Drive or sign in to Google on your device.

## In-app purchases (Pro subscriptions)

**Pro Monthly** and **Pro Max+ Monthly** are optional subscriptions processed entirely by **Google Play Billing**. We do not receive or store your payment card number. Google processes payment under [Google’s terms and privacy policy](https://policies.google.com/privacy).

When you subscribe or tap **Restore purchases**, the app queries Google Play on your device and stores a local entitlement flag so paid features work offline.

**Legal basis (GDPR):** performance of a contract (providing the subscription features you purchased).

## Network connections and third parties

| Service | Purpose | Data involved |
|---------|---------|----------------|
| **Google Play Billing** | Subscription purchase, verification, and restore | Standard Play Billing interaction tied to your Google account |
| **Google Drive (via Android SAF)** | Optional file pick when you tap Google Drive | Files you explicitly select; governed by Google/Android |

Core extraction works **offline**. We do **not** use analytics SDKs, advertising networks, crash reporting tied to identity, or cloud user databases operated by us.

## International data transfers

This app is developed in the United States. When the app contacts Google Play or when you use Google Drive through the system picker, data may be processed in countries outside your own, including outside the EEA/UK. Those providers apply their own safeguards as described in their privacy policies.

We do not transfer personal data from your device to servers we operate.

## Retention

- **On-device preferences, usage counters, and copied files:** kept until you clear app storage, delete files in the app, or uninstall the app
- **Data held by Google or other third parties:** governed by their retention policies

## Your rights (EEA / UK / similar jurisdictions)

Depending on where you live, you may have the right to:

- **Access** information about processing (this policy describes what we process)
- **Erasure** — uninstall the app or clear storage in Android settings (**Settings → Apps → Deadline Renew → Storage → Clear data**)
- **Withdraw consent** — stop using optional features such as Google Drive import
- **Object** to processing based on legitimate interest — contact us; given our minimal processing, uninstalling or clearing data is usually sufficient
- **Lodge a complaint** with your local data protection supervisory authority

We do not maintain remote user profiles. Most requests can be fulfilled on your device without contacting us. For other privacy questions or to exercise your rights, email **designstehev@gmail.com**.

## What we do not collect

We do not collect your name, email, payment card numbers, or document contents through servers we operate. The app does not require account registration.

## Children

This app is not directed at children. It should not be used by anyone under **16** without parental or guardian consent where local law requires it.

## Changes

We may update this policy as the app evolves. Material changes will be reflected in the in-app **Settings → Privacy Policy** text and in this document.

## Contact

Privacy questions: **designstehev@gmail.com**

You may also use the developer contact shown on the Deadline & Renewal Extractor Google Play store listing.
