(setq hackartist-dart-layers
      '(
        (dart :variables dart-backend 'lsp lsp-dart-sdk-dir "/opt/flutter/bin/cache/dart-sdk" lsp-enable-on-type-formatting t)
        ))

(defun hackartist/dart/init ())

(defun hackartist/dart/bindings ()
  "key bindings in dart mode"
  (spacemacs/declare-prefix-for-mode 'dart-mode "f" "flutter")
  (spacemacs/set-leader-keys-for-major-mode 'dart-mode
    "SPC" 'lsp-dart-dap-flutter-hot-reload
    "TAB" 'flutter-run-or-hot-reload
    "RET" 'hackartist/flutter-run-or-hot-restart)
  )

(defun hackartist/flutter-run-or-hot-restart ()
  "Start `flutter run` or hot-reload if already running."
  (interactive)
  (if (flutter--running-p)
      (flutter-hot-restart)
    (flutter-run)))

(defun hackartist/dart/before-save-hook ()
  (when (derived-mode-p 'dart-mode)
    (lsp-format-buffer)
    (flutter-run-or-hot-reload)))
