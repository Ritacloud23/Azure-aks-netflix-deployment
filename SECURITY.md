# Security Vulnerability Report

## Scan Tools
- **Trivy** — Container image scanning
- **Snyk** — Dependency scanning

## Known Vulnerabilities

| CVE | Severity | Component | Status |
|-----|----------|-----------|--------|
| CVE-2023-20860 | CRITICAL | Spring Framework 6.0.3 | Fix: upgrade to Spring Boot 3.1+ |
| CVE-2025-24813 | CRITICAL | Apache Tomcat | Fix: upgrade embedded Tomcat |
| CVE-2026-29145 | CRITICAL | Apache Tomcat | Fix: upgrade embedded Tomcat |
| CVE-2023-28154 | CRITICAL | webpack 5.75.0 | Fix: upgrade to webpack 5.76.0+ |

## Remediation Plan
1. Upgrade Spring Boot from 3.0.x to 3.2+
2. Upgrade frontend dependencies via `npm audit fix`
