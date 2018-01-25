;; theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
;; json
(require 'json-reformat)
(require 'json-snatcher)
(require 'json-mode)
;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;; sos
(require 'sos)
;; dockerfile
(require 'dockerfile-mode)
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("Dockerfile\\'" . dockerfile-mode)))
;; auto-complete
;; (require 'init-auto-complete)
;; 自动完成功能默认配置
;;(ac-config-default)
;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; 将yasnippet补全快捷键设置为C+;
(global-set-key (kbd "C-;") 'yas/expand)
;; Markdown
(require 'markdown-preview-eww)
