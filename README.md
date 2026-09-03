# Quantum-CoreOS

```text
Tri-Solaris Alliance // Quantum Core OS v2163.4
-----------------------------------------------
SYSTEM:  Standard Alltags-OS (Klasse-3 Zivil / Militär)
KERNEL:  Quantum-UNIX 6.163-TSA-generic
HOST:    Tri-Solaris Mainframe [Sector Sol-3]
ARCH:    Q-x86_64 / Entangled-Bit Architecture

NODE:    Hyperion Node-7
GRID:    Tri-Solaris Quantum Mesh
STATUS:  ONLINE
UPLINK:  SECURE
SYNC:    99.9987 %

AI CORE: TSA Standard Cognitive Runtime
LOCAL AI: ENABLED
BIO-LINK: AVAILABLE
QUANTUM CHANNELS: 128 / 128

MEMORY:  184.2 TB Q-RAM
STORAGE: 7.8 PB Q-NVMe
COMPUTE: 3.91 QFLOPS
POWER:   NOMINAL

USER ACCESS:
NARU-CIVIL // AUTHENTICATED

Welcome to Quantum Core OS.
```

## Real project status

Quantum CoreOS is planned as an AI-first operating-system platform with an integrated but modular AI runtime, server control layer, Terran Cognitive Intelligence and distinctive desktop shell.

The operating system itself is deliberately built last. Its two reusable upstream modules are developed and proven independently first:

- `Starlight-Unit-Studio/Quantum-Runtime`, the model and inference service
- `Starlight-Unit-Studio/Quantum-Control`, the Linux and server administration platform

Both projects now contain executable `0.1.0-alpha.1` foundations. Quantum CoreOS is not yet a bootable distribution and does not claim a completed Runtime, KeyHelp replacement or TCI.

Ember CoreUI remains a permanent standalone Repack for users who do not want to replace their existing operating system. Quantum CoreOS may later provide an optimized CoreUI package, but it never becomes a CoreUI prerequisite.

The 2163 terminal block above is fictional Starlight Unit material. `Quantum Core OS`, `Quantum-UNIX`, Tri-Solaris Alliance and Hyperion Node are in-universe references, not claims about current real-world certification, hardware or capability.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Roadmap](docs/ROADMAP.md)
- [Implementation status](docs/IMPLEMENTATION-STATUS.md)
- [Project boundaries](docs/PROJECT-BOUNDARIES.md)
- [TCI plan](docs/TCI.md)
- [Interface design](docs/INTERFACE-DESIGN.md)
- [Public in-universe canon](docs/CANON-PUBLIC.md)
- [Quantum license family](docs/LICENSE-FAMILY.md)

The canonical animated Ren Matrix master asset is stored at `assets/ren-matrix/ren-matrix-logo.svg` and is planned as the basis of the Quantum CoreOS pointer system.

## License

Quantum CoreOS project-owned code and project-owned assets are licensed under the **Starlight Unit Studios Quantum CoreOS Community Source License 1.0**.

- private and internal use is royalty-free
- commercial service operation on Quantum CoreOS is permitted
- hardware, installation, configuration, support, compute, storage, network and management charges are permitted
- systems may be transferred with Quantum CoreOS preinstalled when no separate CoreOS license fee is charged and all distribution conditions are met
- there are no user, device, CPU, GPU, server or instance limits and no license-enforcement telemetry requirement
- distributed modifications must retain attribution, provide corresponding source code and build material, use the same license, and identify themselves as unofficial
- Quantum CoreOS itself may not be sold as a software license, activation, paid download, image subscription, standalone operating system or white-label distribution
- third-party operating-system packages, inference engines, models, model weights, fonts, drivers and tools retain their own terms

The legally controlling German text is in `LICENSE.de.md`. `LICENSE.md` is an English convenience translation. See also `LICENSE_HISTORY.md`, `NOTICE.md`, `COPYRIGHT.md`, `TRADEMARKS.md`, `THIRD_PARTY_NOTICES.md`, and `docs/LICENSE-FAMILY.md`.

This is a custom Source Available license and is not an OSI-approved open-source license.
