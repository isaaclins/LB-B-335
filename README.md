# TodoApp - Mobile-Anwendungsprojekt (LB-B-335)

Dieses Repository enthält eine auf Flutter basierende Todo-Anwendung, die im Rahmen des Modul 335 Bewertungsprojekts erstellt wurde. Die App demonstriert verschiedene Konzepte der mobilen Anwendungsentwicklung und erfüllt die erforderlichen Rahmenbedingungen.

## Projektübersicht

Die TodoApp ist eine Aufgabenverwaltungsanwendung, die es Benutzern ermöglicht, ihre Aufgaben zu erstellen, zu verwalten und zu verfolgen, mit Funktionen wie:

- Aufgabenerstellung, -bearbeitung und -löschung
- Kategorisierung und Priorisierung von Aufgaben
- Verfolgung der Aufgabenabschlüsse mit Animationen
- Lokale Datenpersistenz
- Aufgabenbenachrichtigungen

## Repository-Struktur

### Dokumentationsdateien

- `docs/01-pitch/` - Enthält die Pitch-Präsentation für die App-Idee
- `docs/storyboard/` - Enthält die Storyboard-Diagramme, die den App-Fluss zeigen
- `docs/uml/` - Enthält die UML-Anwendungsfalldiagramme und Akteursbeschreibungen
- `docs/FURPSRequirements.md` - Nicht-funktionale Anforderungen nach FURPS-Methodik
- `docs/testing/` - Enthält Testkonzeptdokumentation und Testprotokolle
- `docs/architecture/` - Enthält Systemarchitekturdiagramme
- `docs/reflection/` - Enthält das 3-Punkte-Reflexionsdokument
- `docs/appstore/` - Enthält App-Store-Listungsmaterialien

### Anwendungsdateien

- `todoapp/` - Hauptanwendungsverzeichnis
  - `lib/` - Quellcode mit ordnungsgemäßer Schichtentrennung
    - `domain/` - Geschäftsentitäten und Schnittstellen
    - `application/` - Geschäftslogik und Anwendungsfälle
    - `infrastructure/` - Externe Implementierungen und Datenquellen
    - `presentation/` - UI-Komponenten und Bildschirme
  - `test/` - Automatisierte Tests
  - `apk/` - Enthält die kompilierte Installationsdatei
  - `analysis_options.yaml` - Linter-Konfiguration

## KI-Unterstützung

Claude (Anthropics KI-Assistent) hat Unterstützung geleistet bei:

- Projektstrukturplanung und -organisation
- Empfehlungen zur Code-Architektur
- Dokumentationsvorlagen
- Anleitung zur Erstellung von UML-Diagrammen

Die folgenden Dateien wurden mit KI-Unterstützung erstellt:

- `todoapp/lib/domain/models/todo.dart` - Datenmodelldefinitionen
- `todoapp/lib/application/services/todo_service.dart` - Geschäftslogikdienste
- `todoapp/lib/infrastructure/repositories/todo_repository.dart` - Datenpersistenz
- `todoapp/lib/presentation/screens/todo_list_screen.dart` - Haupt-UI-Bildschirm
- `docs/FURPSRequirements.md` - Dokument zu nicht-funktionalen Anforderungen
- `.gitignore` - Git-Ignore-Datei für das Projekt

## Versionskontrolle

Das Repository folgt korrekten Versionskontrollpraktiken mit atomaren Commits und aussagekräftigen Commit-Nachrichten. Screenshots des Versionsverlaufs sind in der Dokumentation verfügbar.

## Code-Konventionen

Der Codebase hält sich an angemessene Coding-Konventionen:

- Methoden unter 30 Zeilen (ausgenommen UI-Generierungsmethoden)
- Englische Benennung für alle Variablen, Properties und Methoden
- Korrekte Case-Konventionen (Flutter/Dart-Richtlinien)
- Linter-Implementierung über `analysis_options.yaml`
