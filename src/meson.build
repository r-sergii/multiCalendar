multicalendar_sources = [
  'main.vala',
  'windows/main_window/main_window.vala',
  'windows/splash_window/splash_window.vala',
  'windows/language_window/language_window.vala',
  'windows/no_connect_window/no_connect_window.vala',
  'views/vert_view.vala',
  'views/horiz_view.vala',
  'views/calendar_view.vala',
  'views/wait_view.vala',
  'widgets/theme_switcher/theme_switcher.vala',
  'widgets/circular-progress-bar/procent-progress-bar.vala',
  'widgets/circular-progress-bar/circular-progress-bar.vala',
  'widgets/circular-progress-bar/circle-indicator.vala',
  'widgets/date_widget/date_widget.vala',
  'services/calendar/calendar_service.vala',
  'services/calendar/calendar_provider.vala',
  'services/calendar/calendar_model.vala',
  'services/calendar0/calendar0_service.vala',
  'services/calendar0/calendar0_provider.vala',
  'services/calendar0/calendar0_model.vala',
  'services/connect/connect_service.vala',
  'services/connect/connect_provider.vala',
  'services/connect/connect_model.vala',
  'services/settings/settings_service.vala',
  'services/settings/settings_model.vala',
  'services/settings/theme_model.vala',
  'services/settings/locale_model.vala',
  'services/translate/translate_service.vala',
  'services/translate/translate_provider.vala',
  'services/translate/translate_model.vala',
  'utils/http.vala',
  'application.vala',
]

multicalendar_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('gio-2.0'),
  dependency('gee-0.8'),
  dependency('json-glib-1.0')
#  dependency('pango', version: '>= 1.0'),
#  dependency('pangocairo', version: '>= 1.0')
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
