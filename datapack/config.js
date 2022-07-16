const { exec } = require('child_process')

module.exports = {
	global: {
		onBuildSuccess: (build) => {
			if (build) {
				exec(
					`.\\package.ps1"`,
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
		header: '# Developed by SnaveSutit (Discord: SnaveSutit#0042 | Email: SnaveSutit@gmail.com)\n# built using mc-build (https://github.com/mc-build/mc-build)',
		internalScoreboard: 'i',
		generatedDirectory: 'zzz',
		rootNamespace: null,
	},
}
