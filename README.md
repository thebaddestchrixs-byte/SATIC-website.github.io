# SATIC — Flutter Web Source

This is a **real Flutter web project**, not a pre-built site. It was
generated in a sandboxed environment with no Flutter SDK and no internet
access, so it could not be compiled here — you'll need to run one build
step yourself, on a machine with Flutter installed.

## What's inside

```
lib/
  main.dart                  entry point, ties sections together
  theme/tokens.dart           colors, type styles, breakpoints
  data/content.dart           <-- EDIT THIS for real names/captions
  widgets/                    nav bar, buttons, glowing bulb mark, marquee
  sections/                   hero, about, work, team, join, footer
assets/
  brand/   logo (full + icon crop, background removed), tagline card
  team/    7 individual member photos + 1 group photo
  work/    3 real project/session photos
web/       standard Flutter web scaffold (index.html, manifest.json)
pubspec.yaml
```

Every image used is a real photo from the club's own uploads — nothing
generated or stock. The only placeholder content is team member **names
and roles**, which weren't provided — see below.

## 1. Edit the real content

Open `lib/data/content.dart`. Replace `'Member name'` / `'Role / year'`
for each of the 7 entries in `kTeam` with the real names, in the same
order as the photos in `assets/team/member_01.jpg` … `member_07.jpg`.
You can also tweak the gallery captions in `kWork` and the contact email
`kEmail`.

## 2. Set up the Flutter scaffold (one-time)

This project ships with a hand-written `web/index.html` and
`manifest.json` that match recent Flutter versions. If `flutter build
web` complains about the web/ folder (version mismatch), regenerate it
without touching your code:

```bash
flutter create --platforms=web temp_scaffold
cp -r temp_scaffold/web/. web/
rm -rf temp_scaffold
```

This only replaces the boilerplate web/ files — it won't touch
`lib/`, `assets/`, or `pubspec.yaml`.

## 3. Install packages and run

```bash
flutter pub get
flutter run -d chrome        # live preview
```

## 4. Build the production site

```bash
flutter build web --release
```

Output lands in `build/web/` — upload that folder's contents to any
static host (Netlify, Vercel, Firebase Hosting, GitHub Pages, S3, etc.).

## Notes

- Fonts (Fraunces / IBM Plex Sans / IBM Plex Mono) are pulled at build
  time via the `google_fonts` package — no manual font files needed,
  but the build machine needs internet access the first time.
- The hero's pulsing bulb is the club's own logo icon crop
  (`assets/brand/logo_icon.png`, background removed) with a painted glow
  animation — no external image generation involved.
- The Smart Duuka poster from the uploads was left out — it's a
  different project, unrelated to SATIC.
