// ---------------------------------------------------------------------
// This template script adds a few useful arguments to the mcbuild cli:
// -package: Build and package the world, data pack, and resource pack.
// ---------------------------------------------------------------------

const { exec } = require('child_process')

module.exports = {
	global: {
		onBuildSuccess: (build) => {
			if (process.argv.includes('-package')) {
				exec(
					`.\\package.ps1`,
					{ shell: 'powershell.exe', cwd: '..'},
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
