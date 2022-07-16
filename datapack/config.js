const { exec } = require('child_process')

module.exports = {
	global: {
		onBuildSuccess: (build) => {
			if (build.config.mc.package_after_build) {
				exec(
					`".\\package.ps1"`,
					{ shell: 'powershell.exe' },
					(err, stdout, stderr) => {
						if (err) {
							console.error(err)
							return
						}
						console.log(stdout)
					}
				)
			}
		},
	},
	mc: {
		dev: true,
		// Whether or not to compile the packaged version of the world after the build process is complete.
		package_after_build: false,
		header: '# Developed by SnaveSutit (Discord: SnaveSutit#0042 | Email: SnaveSutit@gmail.com)\n# built using mc-build (https://github.com/mc-build/mc-build)',
		internalScoreboard: 'i',
		generatedDirectory: 'zzz',
		rootNamespace: null,
	},
}
