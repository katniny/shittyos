# Building ShittyOS
Why?

Anyways, using a Fedora-based distro (whether real hardware or VM), do the following:
1. Open your terminal and run `sudo dnf install livecd-tools git` (though Fedora should come with Git)
2. Run `cd src`
3. Run `sudo livecd-creator --verbose --config=shittyos-live-essentials.ks --fslabel=ShittyOS --cache=/var/cache/shittyos-live`

> [!NOTE]
> Do not panic if it appears stuck at `0`, it's not!

That's it, you now have your own ShittyOS build! In order to contribute to ShittyOS, please feel free to:
- Modify the `src/shittyos-live-essentials.ks` file
- Modify any app inside the `apps/` folder
# TODO: do we have more?