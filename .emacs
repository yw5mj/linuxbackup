(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;screen adjustment by F11 key
(tool-bar-mode -1)
(menu-bar-mode -1)
(defun switch-fullscreen nil
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))
(define-key global-map [f11] 'switch-fullscreen)
;;start terminal with bash
(defun my-term ()
  (interactive)
  (term "/bin/bash"))
(global-set-key (kbd "<f4>") 'my-term)

;;w3m settings
;(setq w3m-default-display-inline-images t) 
(setq w3m-home-page "http://www.google.com")
(global-set-key (kbd "<f3>") 'w3m)

;;biligrab settings
(defun biligrab ()
  (interactive)
  (shell-command
   (concat "~/bin/bilidan " (w3m-print-this-url(point)))))
(global-set-key (kbd "<f5>") 'biligrab)

;;emms settings
(add-to-list 'load-path "~/usr/emms/lisp")
(require 'emms-setup)
(require 'emms-player-mplayer)
(emms-standard)
(emms-default-players)
(define-emms-simple-player mplayer '(file url)
      (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
                    ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
                    ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
      "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")
(defun music ()
  (interactive)
  (emms-add-directory-tree "~ycwang/Music")
  (emms-playlist-mode-go))
(global-set-key (kbd "<f2>") 'music)
