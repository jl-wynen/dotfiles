;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize Emacs Lisp modes
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "jl-prettify-symbols.el")

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (setq indent-tabs-mode nil)
                                  (unless (version< emacs-version "24.4")
                                    (setq prettify-symbols-alist
                                          (append jl/prettify-greek-alist
                                                  jl/prettify-math-alist
                                                  prettify-symbols-alist))
                                    (prettify-symbols-mode))))

(add-hook 'lisp-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)
                            (unless (version< emacs-version "24.4")
                              (setq prettify-symbols-alist
                                    (append jl/prettify-greek-alist
                                            jl/prettify-math-alist
                                            prettify-symbols-alist))
                              (prettify-symbols-mode))))

(add-hook 'lisp-interaction-mode-hook (lambda ()
                                        (setq indent-tabs-mode nil)
                                        (unless (version< emacs-version "24.4")
                                          (setq prettify-symbols-alist
                                                (append jl/prettify-greek-alist
                                                        jl/prettify-math-alist
                                                        prettify-symbols-alist))
                                          (prettify-symbols-mode))))
