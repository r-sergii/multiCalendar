multicalendar_sources = [
  'main.vala',
  'windows/main_window/main_window.vala',
  'windows/splash_window/splash_window.vala',
  'widgets/theme_switcher/theme_switcher.vala',
  'widgets/circular-progress-bar/circular-progress-bar.vala',
  'services/calendar/calendar_service.vala',
  'services/calendar/calendar_provider.vala',
  'services/calendar/calendar_model.vala',
  'utils/http.vala',
  'application.vala',
]

multicalendar_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('gio-2.0'),
  dependency('gee-0.8'),
  dependency('json-glib-1.0')
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
