Container sichern & beschränken
===

Das Dockerfile verwendet ein schlankes Python-3.9 Basisimage, um den Container möglichst klein zu halten und damit das Angriffsrisiko zu reduzieren. Durch das Erstellen eines separaten Benutzers und die Verwendung einer requirements.txt-Datei zur Begrenzung der Berechtigungen wird die Angriffsfläche weiter minimiert und die Sicherheit der Anwendung erhöht.

Protokollieren & Überwachen
===

Dieses Dockerfile baut ein Image auf Basis des google/cadvisor-Images und stellt darin einen cAdvisor-Container bereit. Der Port 8080 wird freigegeben, um auf die cAdvisor-Web-Schnittstelle zugreifen zu können. Der Befehl CMD startet cAdvisor mit den Optionen --logtostderr und --port=8080.

Testfälle
======
| Testfall                                                  | geschätztes Ergebniss                       | effektives Ergebnis |
| --------------------------------------------------------- | ------------------------------------------- | ------------------- |
| 1. Image erstellen                                        | Image wird erfolgreich erstellt             | JA            |
| 2. Container erstellt                                     | Container wird erfolgreich erstellt         | JA            |
| 3. Container ist abrufbar                                 | Container konnte abgerufen werden           | JA            |
| 4. Reproduzierbarkeit                                     | Container wird genau gleich erstellt        | JA             |
| 5. Container kann von jemand anderes auch erstellt werden | bei aimo/luka genau gleich erstellt              | JA             |

[&uarr; nach oben](https://github.com/JenniLino/M300-Services/tree/main/M300_35-Sicherheit)
