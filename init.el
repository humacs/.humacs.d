(message "humacs: init.el LOADING")

;; This folder is where our combined humacs is loaded from
;; This could be loaded via EMACS_LOAD_PATH
(setq humacs-dir (file-name-directory load-file-name))

;; Allow folks to have there own, but by default use the submodule of this repo
(if (getenv "DOTSPACEMACS_FILEPATH")
	(setq dotspacemacs-filepath (getenv "DOTSPACEMACS_FILEPATH"))
  (setq dotspacemacs-filepath (concat humacs-dir ".spacemacs.d/init.el"))
  )

;; Ensure customizations don't hit git
(setq custom-file (concat humacs-dir "customizations"))

;; This is the folder containing the spacemacs repository as a submodule
(setq spacemacs-start-directory (concat humacs-dir "spacemacs/"))

;; The .lock file isn't something I want to commit, but I want to use humacs copy
;; as it uses the local intall cache
;; TODO: getting some errors on package signatures 8(
;;(delete-file (concat spacemacs-start-directory ".lock"))
;;(copy-file (concat humacs-dir ".lock") (concat spacemacs-start-directory ".lock"))

;; From here we locate spacemacs source and run it's normal init.el
(load-file (concat spacemacs-start-directory "init.el"))

(message "humacs: init.el LOADED")
