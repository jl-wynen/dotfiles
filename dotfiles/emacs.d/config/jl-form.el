;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize Emacs FORM mode
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'form-mode)

;; some extra prettifications
(defconst jl/prettify-form-alist
  '(("g_" . ?γ)
    ("G_" . ?γ)
    ("e_" . ?ε)
    ("E_" . ?ε)
    ("d_" . ?δ)
    ("D_" . ?δ)
    ("sum_" . ?Σ)
    ))

(load "jl-prettify-symbols.el")

(add-hook 'form-mode-hook (lambda ()
                            (setq prettify-symbols-alist
                                  (append jl/prettify-greek-alist
                                          jl/prettify-form-alist
                                          prettify-symbols-alist))
                            (prettify-symbols-mode)
                            (auto-complete-mode)
                            (visual-line-mode)
                            (flycheck-mode)
                            (setq flycheck-highlighting-mode 'lines)
                            (setq flycheck-idle-change-delay 2)
                            (setq indent-tabs-mode nil)
                            ))

;; shortcuts to insert greek letters like in LaTeX mode
(define-key form-mode-map (kbd "´ a") (lambda () (interactive) (insert "alpha")))
(define-key form-mode-map (kbd "´ b") (lambda () (interactive) (insert "beta")))
(define-key form-mode-map (kbd "´ c") (lambda () (interactive) (insert "chi")))
(define-key form-mode-map (kbd "´ d") (lambda () (interactive) (insert "delta")))
(define-key form-mode-map (kbd "´ e") (lambda () (interactive) (insert "epsilon")))
(define-key form-mode-map (kbd "´ f") (lambda () (interactive) (insert "phi")))
(define-key form-mode-map (kbd "´ g") (lambda () (interactive) (insert "gamma")))
(define-key form-mode-map (kbd "´ h") (lambda () (interactive) (insert "eta")))
(define-key form-mode-map (kbd "´ i") (lambda () (interactive) (insert "iota")))
(define-key form-mode-map (kbd "´ k") (lambda () (interactive) (insert "kappa")))
(define-key form-mode-map (kbd "´ l") (lambda () (interactive) (insert "lambda")))
(define-key form-mode-map (kbd "´ m") (lambda () (interactive) (insert "mu")))
(define-key form-mode-map (kbd "´ n") (lambda () (interactive) (insert "nu")))
(define-key form-mode-map (kbd "´ o") (lambda () (interactive) (insert "omicron")))
(define-key form-mode-map (kbd "´ p") (lambda () (interactive) (insert "pi")))
(define-key form-mode-map (kbd "´ q") (lambda () (interactive) (insert "theta")))
(define-key form-mode-map (kbd "´ r") (lambda () (interactive) (insert "rho")))
(define-key form-mode-map (kbd "´ s") (lambda () (interactive) (insert "sigma")))
(define-key form-mode-map (kbd "´ t") (lambda () (interactive) (insert "tau")))
(define-key form-mode-map (kbd "´ u") (lambda () (interactive) (insert "upsilon")))
(define-key form-mode-map (kbd "´ w") (lambda () (interactive) (insert "omega")))
(define-key form-mode-map (kbd "´ x") (lambda () (interactive) (insert "xi")))
(define-key form-mode-map (kbd "´ y") (lambda () (interactive) (insert "psi")))
(define-key form-mode-map (kbd "´ z") (lambda () (interactive) (insert "zeta")))

(define-key form-mode-map (kbd "´ A") (lambda () (interactive) (insert "Alpha")))
(define-key form-mode-map (kbd "´ B") (lambda () (interactive) (insert "Beta")))
(define-key form-mode-map (kbd "´ C") (lambda () (interactive) (insert "Chi")))
(define-key form-mode-map (kbd "´ D") (lambda () (interactive) (insert "Delta")))
(define-key form-mode-map (kbd "´ E") (lambda () (interactive) (insert "Epsilon")))
(define-key form-mode-map (kbd "´ F") (lambda () (interactive) (insert "Phi")))
(define-key form-mode-map (kbd "´ G") (lambda () (interactive) (insert "Gamma")))
(define-key form-mode-map (kbd "´ H") (lambda () (interactive) (insert "Eta")))
(define-key form-mode-map (kbd "´ I") (lambda () (interactive) (insert "Iota")))
(define-key form-mode-map (kbd "´ K") (lambda () (interactive) (insert "Kappa")))
(define-key form-mode-map (kbd "´ L") (lambda () (interactive) (insert "Lambda")))
(define-key form-mode-map (kbd "´ M") (lambda () (interactive) (insert "Mu")))
(define-key form-mode-map (kbd "´ N") (lambda () (interactive) (insert "Nu")))
(define-key form-mode-map (kbd "´ O") (lambda () (interactive) (insert "Omicron")))
(define-key form-mode-map (kbd "´ P") (lambda () (interactive) (insert "Pi")))
(define-key form-mode-map (kbd "´ Q") (lambda () (interactive) (insert "Theta")))
(define-key form-mode-map (kbd "´ R") (lambda () (interactive) (insert "Rho")))
(define-key form-mode-map (kbd "´ S") (lambda () (interactive) (insert "Sigma")))
(define-key form-mode-map (kbd "´ T") (lambda () (interactive) (insert "Tau")))
(define-key form-mode-map (kbd "´ U") (lambda () (interactive) (insert "Upsilon")))
(define-key form-mode-map (kbd "´ W") (lambda () (interactive) (insert "Omega")))
(define-key form-mode-map (kbd "´ X") (lambda () (interactive) (insert "Xi")))
(define-key form-mode-map (kbd "´ Y") (lambda () (interactive) (insert "Psi")))
(define-key form-mode-map (kbd "´ Z") (lambda () (interactive) (insert "Zeta")))
