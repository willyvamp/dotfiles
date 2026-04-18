;;; WARNING: EMACS IS SET TO HOLD by /apt-mark hold/ to disable automatically update
;;;
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "hwpham"
      user-mail-address "phamhieu592001@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
(setq doom-font (font-spec :size 13))
(setq doom-symbol-font (font-spec :family "Adwaita Mono":size 12))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/org/")
(setq org-roam-directory (file-truename "~/notes/roam/"))

(setq org-roam-file-extensions '("org"))

;; (use-package! pangu-spacing
;;   :ensure t
;;   :config
;;   (global-pangu-spacing-mode 1))

(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

(setq org-roam-capture-templates
      '(("m" "main" plain "%?"
         :if-new (file+head "main/${slug}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)

        ("r" "reference" plain "%?"
         :if-new (file+head "reference/${title}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)

        ("f" "default" plain "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)

        ("x" "Linux Device Driver 3rd" plain "%?"
         :if-new (file+head "reference/LLD3/${slug}.org"
                            "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)
          
        ("g" "Pro Git" plain "%?"
         :if-new (file+head "reference/ProGit/${slug}.org"
                            "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)

        ("c" "C Programming Language" plain "%?"
         :if-new (file+head "reference/C_Programming_Language/${slug}.org"
                            "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)

        ("l" "Linux by Jannis Seemann" plain "%?"
         :if-new (file+head "reference/Linux_by_Jannis_Seeman/${slug}.org"
                            "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)))

;; Daily TODO templates
(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
      '(("d" "Daily notes" plain "%?"
         :if-new (file+head "%<%Y-%m-%d>.org"
"#+title: %<%Y-%m-%d>
* TODO daily routine [/]

** [ ] weigh

** [ ] morning deep work [/]
*** TODO 

** [ ] read [/]
*** TODO read

** [ ] exercises
*** TODO ride
*** TODO run

** [ ] anki [/]
*** TODO sync offline note from KOreader
*** TODO review anki cards

* TODO other tasks [/]
** TODO ")
:unnarrowed t)))

;;(use-package 'ui/unicode)
;;(set-input-method "vietnamese-telex")

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/notes/roam/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-ui-mode)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  ;; (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


(use-package vter
  :ensure t
  :commands vterm)

;; (setq yank-media-insert-function
;;  (lambda (file)
;;    (insert (format "[[attachment:%s]]" (file-name-nondirectory file)))))

(with-eval-after-load 'org
  (setq org-yank-image-save-method 'attach))

;; (use-package lsp-pyright
;;   :ensure t
;;   :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp))))  ; or lsp-deferred

;;Exit insert mode by pressing j and then j quickly
;; (setq key-chord-two-keys-delay 0.5)
;; (key-chord-mode 1)
;; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;;org map
(map! :map org-mode-map
      :n "M-j" #'org-metadown
      :n "M-k" #'org-metaup)

;; set firefox to open URLs
(setq browse-url-browser-function 'browse-url-firefox)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
