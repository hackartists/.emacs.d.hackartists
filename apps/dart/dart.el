(setq hackartist-dart-layers
      '(
        (dart :variables dart-backend 'lsp lsp-dart-sdk-dir "/opt/flutter/bin/cache/dart-sdk" lsp-enable-on-type-formatting t dart-server-format-on-save t)
        ))

(defun hackartist/dart/init ()
  (dap-register-debug-template "Flutter :: Debug"
                             (list :type "flutter"
                                   :request "launch"
                                   :name "Launch Flutter Web with .build/config.json"
                                   :mode "debug"
                                   :program nil
                                   :args "--dart-define-from-file=.build/config.json"
                                   :env nil
                                   :envFile nil))

  ;; (add-hook 'after-save-hook 'hackartist/dart/after-save-hook)
  (add-hook 'before-save-hook 'hackartist/dart/before-save-hook))

(defun hackartist/dart/bindings ()
  "key bindings in dart mode"
  (spacemacs/declare-prefix-for-mode 'dart-mode "f" "flutter")
  (spacemacs/set-leader-keys-for-major-mode 'dart-mode
    "RET" 'lsp-dart-dap-flutter-hot-reload
    "SPC" 'lsp-dart-dap-flutter-hot-restart
    "'" 'hackartist/flutter-run-web-with-build-config
    "TAB" 'flutter-run-or-hot-reload)
  )

(defun hackartist/flutter-run-or-hot-restart ()
  "Start `flutter run` or hot-reload if already running."
  (interactive)
  (when (flutter--running-p)
      (flutter-hot-restart)))

(defun hackartist/flutter-run-web-with-build-config ()
  (interactive)
  (flutter-run "-d web-server --web-port 5000 --dart-define-from-file=.build/config.json"))

(defun hackartist/dart/before-save-hook ()
  (when (derived-mode-p 'dart-mode)
    (lsp-format-buffer)))

(defun hackartist/dart/after-save-hook ()
  (when (and (derived-mode-p 'dart-mode) (not (eq nil (flutter--running-p))))
    (flutter-hot-restart)))
