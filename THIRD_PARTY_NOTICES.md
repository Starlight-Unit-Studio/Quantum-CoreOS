# Quantum CoreOS Third-Party Notices

Quantum CoreOS project-owned code and assets are governed by the license identified in `LICENSE_HISTORY.md`. Third-party material is not relicensed by that license.

## Current planning repository

The current repository is a planning and integration repository and is not yet a bootable operating-system image.

The Ren Matrix master asset at `assets/ren-matrix/ren-matrix-logo.svg` is treated as a project-owned Starlight Unit Studios asset, not as a third-party component.

The repository does not currently distribute a Linux kernel, Debian base image, desktop environment, inference engine, Gemma model weights, or other operating-system payload.

## Future images and packages

A future Quantum CoreOS image will contain components under independent licenses. Before any public binary, package, or image release, release metadata must record at least:

- component name and version
- source or project location
- applicable license identifier or license file
- required copyright and attribution notices
- source-code or offer obligations
- modification and redistribution conditions
- model-specific, dataset-specific, firmware-specific, or driver-specific restrictions

Likely categories include:

- Linux kernel and Unix-like userland
- package manager and base distribution packages
- systemd and networking components
- desktop shell or compositor dependencies
- graphics, GPU, audio, Bluetooth, and hardware drivers
- Quantum Runtime and its inference backends
- Quantum Control and supporting services
- models, model weights, tokenizers, and datasets
- fonts, icons, browser components, and media frameworks

Component-specific license texts should be included in the final image and may be stored below `third_party/licenses/` or in the standard operating-system notice locations. This file must be updated for every release whose bundled third-party content changes.
