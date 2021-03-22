# Blockchain Commons `ppa-debian`


### _by [Gorazd Kovacic](https://www.github.com/gorazdko) and [Christopher Allen](https://www.github.com/ChristopherA)_

This repo holds debian packages of various Blockchain Commons tools:
* seedtool
* keytool

See [packages](debian/Packages) for more details.


## Status - Late Alpha

` ppa-debian`  is currently under active development and in the late alpha testing phase. It should not be used for production tasks until it has had further testing and auditing.


## Prerequisites

Debian based Linux OS (e.g. Debian, Ubuntu, Tails), gpg and a gpg keypair

## Instructions

To publish a new debian package (.deb) a maintainer has to:
* create a debian package and push it into this repo
* sign the PPA
* test installing a package on a local machine

### Creating a debian package


Decide on the name of your project in accordance with [[source](https://ubuntuforums.org/showthread.php?t=910717)]

```bash
<project>_<major version>.<minor version>.<package revision>
```

For example:

```bash
helloworld_1.0.1
```

Create a directory with the following structure:

```bash
$ mkdir helloworld_1.0.1
$ mkdir helloworld_1.0.1/usr
$ mkdir helloworld_1.0.1/usr/local
$ mkdir helloworld_1.0.1/usr/local/bin
```

Follow the build instructions of a particular tool that you want to package.
After the executable is generated, copy paste it into `helloworld_1.0.1/usr/local/bin`

Noe create the file `control`:

```bash
mkdir helloworld_1.0-1/DEBIAN
gedit helloworld_1.0-1/DEBIAN/control
```

with the following content:

```bash
Package: helloworld
Version: 1.0.1
Section: base
Priority: optional
Architecture: all
Depends: libsomethingorrather (>= 1.2.13), anotherDependency (>= 1.2.6)
Maintainer: Your Name <you@email.com>
Description: Hello World
 When you need some sunshine, just run this
 small program!
```

Finally, create the package with:

```bash
dpkg-deb --build helloworld_1.0.1
```

Copy paste the generated package `helloworld_1.0.1.deb` into this repo into `debian/`

### Sign the PPA

Execute the script in the root of the project:

```bash
$ ./update.sh
```

*Note:* Maintainer has to set his fingerprint of his `gpg` key in the `update.sh`, e.g.

```bash
KEYNAME=41F0EA1699A74C1E2FA41B538CF96BC3FF9DBBCE
```

and export his public key to the root of this repo:

```bash
key gpg --armor --export "${EMAIL or fingerprint of the key}" > KEY.gpg
```

### Test

Execute these 3 steps to add a gpg key and a ppa to your local database:

```bash
$ wget -O - -o /dev/null  "https://BlockchainCommons.github.io/debian-ppa/KEY.gpg" | sudo apt-key add -
$ wget -O - -o /dev/null  "https://BlockchainCommons.github.io/debian-ppa/debian/BlockchainCommons.list" | sudo tee -a  /etc/apt/sources.list.d/BlockchainCommons.list
$ sudo apt-get update
```

> Note, on Tails OS the second step is:

```bash
$ wget -O - -o /dev/null  "https://BlockchainCommons.github.io/debian-ppa/debian/BlockchainCommons.list" | sed -e "s/https/tor+http/g" | sudo tee -a  /etc/apt/sources.list.d/BlockchainCommons.list
```

Finally, you can install a Blockchain Commons package:

```bash
$ sudo apt-get install package-name
```

where package-name can be:
* seedtool-cli
* keytool-cli

It is recommended to check if the program works and if the version is correctly bumped.


## Financial Support

`ppa-debian` is a project of [Blockchain Commons](https://www.blockchaincommons.com/). We are proudly a "not-for-profit" social benefit corporation committed to open source & open development. Our work is funded entirely by donations and collaborative partnerships with people like you. Every contribution will be spent on building open tools, technologies, and techniques that sustain and advance blockchain and internet security infrastructure and promote an open web.

To financially support further development of `ppa-debian` and other projects, please consider becoming a Patron of Blockchain Commons through ongoing monthly patronage as a [GitHub Sponsor](https://github.com/sponsors/BlockchainCommons). You can also support Blockchain Commons with bitcoins at our [BTCPay Server](https://btcpay.blockchaincommons.com/).

### Project Sponsors

Thanks to our project sponsors for their support of `ppa-debian`:

$sponsor-logo-with-link

$sponsor-description

## Contributing

We encourage public contributions through issues and pull requests! Please review [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our development process. All contributions to this repository require a GPG signed [Contributor License Agreement](./CLA.md).

### Discussions

The best place to talk about Blockchain Commons and its projects is in our GitHub Discussions areas.

[**Gordian System Discussions**](https://github.com/BlockchainCommons/Gordian/discussions). For users and developers of the Gordian system, including the Gordian Server, Bitcoin Standup technology, QuickConnect, and the Gordian Wallet. If you want to talk about our linked full-node and wallet technology, suggest new additions to our Bitcoin Standup standards, or discuss the implementation our standalone wallet, the Discussions area of the [main Gordian repo](https://github.com/BlockchainCommons/Gordian) is the place.

[**Wallet Standard Discussions**](https://github.com/BlockchainCommons/AirgappedSigning/discussions). For standards and open-source developers who want to talk about wallet standards, please use the Discussions area of the [Airgapped Signing repo](https://github.com/BlockchainCommons/AirgappedSigning). This is where you can talk about projects like our [LetheKit](https://github.com/BlockchainCommons/bc-lethekit) and command line tools such as [seedtool](https://github.com/BlockchainCommons/bc-seedtool-cli), both of which are intended to testbed wallet technologies, plus the libraries that we've built to support your own deployment of wallet technology such as [bc-bip39](https://github.com/BlockchainCommons/bc-bip39), [bc-slip39](https://github.com/BlockchainCommons/bc-slip39), [bc-shamir](https://github.com/BlockchainCommons/bc-shamir), [Shamir Secret Key Recovery](https://github.com/BlockchainCommons/bc-sskr), [bc-ur](https://github.com/BlockchainCommons/bc-ur), and the [bc-crypto-base](https://github.com/BlockchainCommons/bc-crypto-base). If it's a wallet-focused technology or a more general discussion of wallet standards,discuss it here.

[**Blockchain Commons Discussions**](https://github.com/BlockchainCommons/Community/discussions). For developers, interns, and patrons of Blockchain Commons, please use the discussions area of the [Community repo](https://github.com/BlockchainCommons/Community) to talk about general Blockchain Commons issues, the intern program, or topics other than the [Gordian System](https://github.com/BlockchainCommons/Gordian/discussions) or the [wallet standards](https://github.com/BlockchainCommons/AirgappedSigning/discussions), each of which have their own discussion areas.

### Other Questions & Problems

As an open-source, open-development community, Blockchain Commons does not have the resources to provide direct support of our projects. Please consider the discussions area as a locale where you might get answers to questions. Alternatively, please use this repository's [issues](./issues) feature. Unfortunately, we can not make any promises on response time.

If your company requires support to use our projects, please feel free to contact us directly about options. We may be able to offer you a contract for support from one of our contributors, or we might be able to point you to another entity who can offer the contractual support that you need.

### Credits

The following people directly contributed to this repository. You can add your name here by getting involved. The first step is learning how to contribute from our [CONTRIBUTING.md](./CONTRIBUTING.md) documentation.

| Name              | Role                | Github                                            | Email                                 | GPG Fingerprint                                    |
| ----------------- | ------------------- | ------------------------------------------------- | ------------------------------------- | -------------------------------------------------- |
| Christopher Allen | Principal Architect | [@ChristopherA](https://github.com/ChristopherA) | \<ChristopherA@LifeWithAlacrity.com\> | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |
| Gorazd Kovacic     | developer  | [@gorazdko](https://github.com/gorazdko)  | \<gorazdko@gmail.com\>  | 41F0 EA16 99A7 4C1E 2FA4 1B53 8CF9 6BC3 FF9D BBCE  |

## Responsible Disclosure

We want to keep all of our software safe for everyone. If you have discovered a security vulnerability, we appreciate your help in disclosing it to us in a responsible manner. We are unfortunately not able to offer bug bounties at this time.

We do ask that you offer us good faith and use best efforts not to leak information or harm any user, their data, or our developer community. Please give us a reasonable amount of time to fix the issue before you publish it. Do not defraud our users or us in the process of discovery. We promise not to bring legal action against researchers who point out a problem provided they do their best to follow the these guidelines.

### Reporting a Vulnerability

Please report suspected security vulnerabilities in private via email to ChristopherA@BlockchainCommons.com (do not use this email for support). Please do NOT create publicly viewable issues for suspected security vulnerabilities.

The following keys may be used to communicate sensitive information to developers:

| Name              | Fingerprint                                        |
| ----------------- | -------------------------------------------------- |
| Christopher Allen | FDFE 14A5 4ECB 30FC 5D22  74EF F8D3 6C91 3574 05ED |

You can import a key by running the following command with that individual’s fingerprint: `gpg --recv-keys "<fingerprint>"` Ensure that you put quotes around fingerprints that contain spaces.
