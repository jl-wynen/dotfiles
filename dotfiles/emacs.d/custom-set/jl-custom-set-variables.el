;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Emacs options that can be set through the GUI.
;;;
;;; Emacs stores those settings in a different file.
;;; This one here is written manually because I find this
;;; easier than digging through the UI.
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(column-number-mode t)           ; show line and column number in mode line
 '(mark-even-if-inactive t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)              ; highlight matching parentheses
 '(fringe-mode (quote (nil . 0)) nil (fringe))

 '(TeX-output-view-style
   (quote
    (
     ("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f")
     ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
     ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d")
     ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d")
     ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d")
     ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d")
     ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
     ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
     ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
     ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
     ("^dvi$" "." "%(o?)xdvi %dS %d")
     ("^pdf$" "." "evince %o")
     ("^html?$" "." "netscape %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Evince") (output-html "xdg-open"))))

 '(ebib-file-associations
   (quote
    (("pdf" . "evince")
     ("ps" . "evince")
     ("dvi" . "evince")
     ("djvu" . "evince"))))
 '(ebib-file-search-dirs
   (quote
    ("~" "~/Documents" "~/Documents/Papers" "~/Documents/Books" "~/Documents/LectureNotes")))
 '(ebib-autogenerate-keys t)
 '(ebib-index-display-fields (quote ("title")))
 '(ebib-preload-bib-files (quote ("~/Uni/MT/thesis/bibliography.bib")))
 '(ebib-timestamp-format "%Y-%m-%dT%T")
 '(ebib-use-timestamp t)
 '(ebib-modified-char "+")
 '(ebib-index-mode-line
   (quote
    ("%e" ((:eval (sml/generate-buffer-identification-if-necessary))
           ;; empty space
           (sml/position-help-text nil
                                   (:eval (let ((sml/-this-buffer-changed-p t))
                                            (sml/generate-position-help))))
           ;; line number with a button to click
           (line-number-mode #("%4l " 0 3 (local-map (keymap (mode-line keymap (down-mouse-1 keymap
                                                                                             (line-number-mode
                                                                                              menu-item
                                                                                              "Display Line Numbers"
                                                                                              line-number-mode
                                                                                              :help "Toggle displaying line numbers in the mode-line"
                                                                                              :button (:toggle . line-number-mode))
                                                                                             "Toggle Line Number Display")))
                                                     mouse-face
                                                     mode-line-highlight
                                                     help-echo
                                                     sml/position-help-text
                                                     face sml/line-number)))
           )
     ebib--mode-line-modified
     sml/pre-id-separator
     mode-line-buffer-identification
     sml/pos-id-separator
     sml/pre-modes-separator
     (:propertize (:eval (format "(%s)" (ebib--get-dialect)))
                  face powerline-active2)
     (:propertize (:eval
                   (if (and ebib--cur-db (ebib-db-get-filter ebib--cur-db))
                       (format "  |%s|"
                               (ebib--filters-pp-filter
                                (ebib-db-get-filter ebib--cur-db)))
                     ""))
                  face powerline-active2)
     (:eval (sml/generate-minor-modes))
     ))) ; ebib-index-mode-line

 '(custom-safe-themes
   (quote
    ("04016dcce00636a653c2a1804184fc0ec3f186ca928177a80754e0025c844fdc" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "fb93a452671a5923798efd117a3799233f43fa19656fac0c5beee8151e7d1e5a" default)))
 )

;;; set default fonts
(custom-set-faces
 '(default ((t (:family "Deja Vu Sans Mono" :slant normal :weight normal :height 160 :width normal))))
 '(tabbar-default ((t (:inherit fixed-pitch :family "Deja Vu Sans Mono" :weight normal))))
 )
