-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Jetico Inc. Oy, Finland

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
BCWipe Total WipeOut

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
BCWipe Total WipeOut is full disk erasure solution users worldwide rely on to protect their privacy when donating, repurposing or selling their PCs. For a security-oriented tool like BCWipe Total WipeOut support for Secure Boot is essential.

Jetico, the vendor of BCWipe Total WipeOut has 25+ years of spotless reputation developing data security products. Jetico products are trusted by government and military agencies, all of the top 10 U.S. defense contractors, many national laboratories, as well as various other enterprises and a wide global base of home and small business users

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Sergey Parfenenok
- Position: Project manager
- Email address: sergey.parfenenok@jetico.com

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Sergey Frolov
- Position: CTO
- Email address: sergey.frolov@jetico.com

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/tree/15.2

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/tree/15.2

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
https://github.com/Jetico/shim-review/blob/master/shim.patch
This code was developed in our company to sign any compopent involved in boot process and thus strongly increase it.

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2: is CVE-2020-10713 fixed ?
-------------------------------------------------------------------------------
Yes

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2, and previous shims were trusting affected
by CVE-2020-10713 grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-10713,
  grub2 builds ?
-------------------------------------------------------------------------------
* No
* Yes it uses mechanism that disallow to boot not signed grub binaries.

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
Yes, our boot chain of trust includes linux kernel upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e.

Yes, it also includes upstream commit 75b0cea7bf307f362057cc778efe89af4c615354

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are whitelisted hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
No we are not using it.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If possible, provide a Dockerfile that rebuilds the shim.
-------------------------------------------------------------------------------
Our build based on gcc 10.2.1 provided by Fedora 32, Dockerfile is included

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
https://github.com/Jetico/shim-review/blob/master/shim_build.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
Our patch to shim 15.2 utilizes the OpenSSL's ability to create and verify files' digests. That allows us to sign every file that is a part of the boot process, including GRUB, Linux kernel, etc and to verify all the signatures. Thus, if a file is replaced by an attacker, it will be detected.
