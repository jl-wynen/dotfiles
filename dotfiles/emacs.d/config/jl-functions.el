;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A bunch of functions that don't fit anywhere else
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun jl/comment-dwim (&optional arg)
  "Choose a commenting function according to which major mode is
active and whether a region is selected.
Call form-comment-dwim for form-mode.
(Un-)comment entire line if region is inactive.
Call comment-dwim else."
  (interactive "*P")
  (comment-normalize-vars)
  (if (derived-mode-p 'form-mode)
      ;;then - call function for form-mode
      (form-comment-dwim arg)
    ;; else - call default function or (un-)comment line if region inactive
    (if (region-active-p)
        (comment-dwim arg)
      (comment-or-uncomment-region (line-beginning-position)
                                   (line-end-position))
      )
    )
  )


(defun jl/modified-buffers-exist()
  "Check if there are any buffers that have been modified.
Return true if there are and nil otherwise. Buffers that have buffer-offer-save set to
nil are ignored."
  (let (modified-found)
    (dolist (buffer (buffer-list))
      (when (and (buffer-live-p buffer)
                 (buffer-modified-p buffer)
                 (not (buffer-base-buffer buffer))
                 (or
                  (buffer-file-name buffer)
                  (progn
                    (set-buffer buffer)
                    (and buffer-offer-save (> (buffer-size) 0))))
                 )
        (setq modified-found t)
        )
      )
    modified-found
    )
  )


(defun client-save-kill-emacs(&optional display)
  "Closes buffers and shuts down the emacs daemon.
Should be called using
emacsclient -e '(client-save-kill-emacs)'. This function will
check to see if there are any modified buffers or active clients
or frame. If so an x window will be opened and the user will
be prompted on what to do."

  (let (new-frame modified-buffers active-clients-or-frames)

    ;; check if there are modified buffers or active clients or frames
    (setq modified-buffers (jl/modified-buffers-exist))
    (setq active-clients-or-frames ( or (> (length server-clients) 1)
                                        (> (length (frame-list)) 1)
                                        ))  

    ;; create new frame if prompts are needed
    (when (or modified-buffers active-clients-or-frames)
      (when (not (eq window-system 'x))
        (message "Initializing x windows system.")
        (x-initialize-window-system))
      (when (not display) (setq display (getenv "DISPLAY")))
      (message "Opening frame on display: %s" display)
      (select-frame (make-frame-on-display display '((window-system . x)))))

    ;; save the current frame
    (setq new-frame (selected-frame))

    ;; When displaying the number of clients and frames:
    ;; subtract 1 from the clients for this client.
    ;; subtract 2 from the frames this frame (that we just created) and the default frame.
    (when ( or (not active-clients-or-frames)
               (yes-or-no-p (format "There are currently %d clients and %d frames. Exit anyway?" (- (length server-clients) 1) (- (length (frame-list)) 2))))
      
      ;; If the user quits during the save dialog then don't exit emacs.
      ;; Still close the terminal though.
      (let((inhibit-quit t))
        ;; Save buffers
        (with-local-quit
          (save-some-buffers))
        
        (if quit-flag
            (setq quit-flag nil)
          ;; Kill all remaining clients
          (progn
            (dolist (client server-clients)
              (server-delete-client client))
            ;; Exit emacs
            (kill-emacs)))
        ))

    ;; If we made a new frame, kill it.
    (when (or modified-buffers active-clients-or-frames) (delete-frame new-frame))
    )
  )


(defun jl/ignore-error-wrapper (fn)
  "Returns a new function that ignores errors.
Wraps `ignore-errors' macro around fn"
  (lexical-let ((fn fn))
    (lambda ()
      (interactive)
      (ignore-errors (funcall fn)))))
