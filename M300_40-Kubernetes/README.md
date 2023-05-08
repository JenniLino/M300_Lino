Apache Server
===

Die .yaml-Datei enthält eine Konfiguration für ein Kubernetes-Deployment und einen Service für eine Apache-Webanwendung. Das Deployment verwendet ein httpd:latest-Image und hört auf Port 80 mit dem Label "app: apache". Der Service leitet den eingehenden Traffic auf Port 80 an das Deployment weiter und öffnet einen Node-Port auf Port 30080.



Cluster
===
Diese YAML-Datei enthält die Definition einer Kubernetes-Deploymentkonfiguration für einen Redis-Datenbank-Server. Das Deployment verwendet das offizielle Redis-Image und definiert ein Pod-Replica-Set mit zwei Replikas. Der Service-Typ ist ClusterIP und er öffnet Port 6379 für eingehenden Datenverkehr. Es ist auch ein Volume für Daten definiert, um die Persistenz der Daten zwischen Pod-Neustarts zu gewährleisten.


Testfälle
======
| Testfall                                                   | geschätztes Ergebniss                       | effektives Ergebnis |
| ---------------------------------------------------------- | ------------------------------------------- | ------------------- |
| 1. Kubernetes erstellen                                    | Kubernetes wird erfolgreich erstellt        | JA             |
| 3. Kubernetes ist abrufbar                                 | Kubernetes konnte abgerufen werden          | JA             |
| 4. Reproduzierbarkeit                                      | Kubernetes wird genau gleich erstellt       | JA             |
| 5. Kubernetes kann von jemand anderes auch erstellt werden | bei luka/aimo genau gleich erstellt         | JA            |

[&uarr; nach oben](https://github.com/JenniLino/M300_Lino/tree/main/M300_40-Kubernetes)
