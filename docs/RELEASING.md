# Quantum CoreOS release process

Quantum CoreOS is intentionally implemented after Quantum Runtime and Quantum Control. Until a bootable OS exists, CoreOS releases are explicitly planning and integration baselines rather than installable operating-system images.

## Current release class

The initial repository release uses version `0.0.1-planning.1`.

It archives:

- architecture and roadmap documents
- interface and TCI specifications
- public in-universe canon notes used by the project
- project-owned interface assets
- implementation and integration status
- project legal and notice files

It does **not** claim to be a bootable Quantum CoreOS distribution.

## Release trigger

A merge to `main` that changes `VERSION`, `CITATION.cff`, this document or `.github/workflows/release.yml` starts the release workflow.

The workflow validates the version, verifies the legal boundary, creates a planning bundle and `SHA256SUMS`, and publishes tag `v<VERSION>` plus a matching GitHub Release when one does not already exist. Planning and alpha versions are GitHub pre-releases.

The pull-request run performs the same validation and archive build without publishing a release.

## Zenodo

When the repository is enabled in Zenodo's GitHub integration, the GitHub Release is the archival boundary and may receive a version-specific DOI.

`CITATION.cff` intentionally contains stable authorship and project metadata without an SPDX license identifier. Quantum CoreOS uses a custom Community Source license whose controlling German text is `LICENSE.de.md`.

After the first Zenodo archive is created, verify that Zenodo displays the custom Quantum CoreOS license rather than an automatically selected default license. If necessary, edit the Zenodo record and add the custom license there.

## Future binary releases

Once CoreOS implementation begins, the release workflow will evolve from a planning bundle to signed installation and update artifacts. Planned future release assets include checksums, package manifests and eventually Server/Desktop/Workstation images. Bootable images must not be attached to a release until the Runtime and Control integration gates in `docs/IMPLEMENTATION-STATUS.md` are satisfied.
