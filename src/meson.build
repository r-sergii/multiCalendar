multicalendar_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
]

multicalendar_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
]

gnome = import('gnome')

multicalendar_sources += gnome.compile_resources('multicalendar-resources',
  'multicalendar.gresource.xml',
  c_name: 'multicalendar'
)

executable('multicalendar', multicalendar_sources,
  vala_args: '--target-glib=2.50',  dependencies: multicalendar_deps,
  install: true,
)
