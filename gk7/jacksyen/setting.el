;;设置自动添加头文件(auto-make-header)
;;(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;;(add-hook 'write-file-hooks 'auto-update-file-header)
(autoload 'auto-make-header "header2")
;;创建python文件自动添加头文件
;;(add-hook 'python-mode-hook 'auto-make-header)

;;显示行号
(global-linum-mode t)
;;显示列号
(column-number-mode t)
;;语法高亮
(global-font-lock-mode t)
;;F11 关闭其它窗口
(global-set-key [f11] 'delete-other-windows)
;;F12 全屏
(global-set-key [f12] 'my-fullscreen)
;;打开图片显示功能
(auto-image-file-mode t)
;;以y代替yes
(fset 'yes-or-no-p 'y-or-n-p)
;;显示括号匹配
(show-paren-mode 1)
;;显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-format "%Y-%m-%d %H:%M")

;;去掉工具栏
(tool-bar-mode 0)
;;去掉滚动条
(scroll-bar-mode 0)
;;光标靠近指针时，让鼠标指针自动让开，避免挡住视线
(mouse-avoidance-mode 'animate)
;;支持中建粘贴
(setq mouse-yank-at-point t)
;;在标题栏提示目前所在位置
(setq my-hostname
      (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" ;; like perl chomp()
                                (with-output-to-string
                                  (call-process "/bin/hostname" nil standard-output nil))))
(setq frame-title-format (list "%b - " (getenv "USER") "@" my-hostname))
;;默认显示 80列
(setq default-fill-column 80)
;;自动存盘
(setq auto-save-mode t)
;;去掉警告铃声
(setq visible-bell nil)
;;设置删除保存记录200
(setq kill-ring-max 200)
;;不要生成临时文件
(setq-default make-backup-files nil)

;;设置as文件用javascript语法高亮
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.as\\'" . javascript-mode)))

;;设置pys文件用py语法高亮
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.pys\\'" . python-mode)))

;;设置复制到系统剪贴板
(setq x-select-enable-clipboard t)

;; 设置文件默认编码
(setq default-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;; 最大化
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disabling File Local Variables
(setq enable-local-variables nil
      enable-local-eval nil)

;; 复制当前目录地址
(defun my/get-curernt-path ()
  (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name)))

(defun my/copy-current-path ()
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (file-truename fPath)))))
(global-set-key (kbd "C-c 0") 'my/copy-current-path)

(defun my/copy-current-file-path ()
  (interactive)
  (let ((orgPath
         (format "%s"   (let* ((fPath (my/get-curernt-path)))

                          ))))
         (message "stored org-link: %s" orgPath)
         (kill-new orgPath)))
(global-set-key (kbd "C-x @") 'my/copy-current-file-path)
