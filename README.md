# Elasticsearch Sysmon using Docker Containers on Ubuntu 20.04

This repository provides a way to create a working Elasticsearch instance for Windows Sysmon data using docker images. It is assumed that you have Windows OS machines configured with Sysmon, Winlogbeat, and an appropriate configuration file similar to one from "SwiftOnSecuriry" ready to send in messages to Elasticsearch.

Below are references to the Windows related documents:
- [Microsoft Sysmon](https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon#)
- [Winlogbeat Reference](https://www.elastic.co/guide/en/beats/winlogbeat/current/_winlogbeat_overview.html#)
- [SwiftOnSecurity github](https://github.com/SwiftOnSecurity/sysmon-config)

The files in this repository were designed, installed, and tested using Ubuntu 20.04 Desktop.
The docker containers are loosely based upon an [article on logz.io](https://www.logz.io/learn/docker-monitoring-elk-stack).

