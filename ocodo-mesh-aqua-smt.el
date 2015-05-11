;;; ocodo-steps-aqua-smt --- Yet another attempt at a super cool modeline for Emacs
;;
;; Author: ocodo <what.is.ocodo@gmail.com>
;; Package-Requires: ((svg-mode-line-themes))
;; Version: 0.1.1
;; URL: https://github.com/ocodo/ocodo-svg-modelines
;;
;;; Commentary:
;;
;; Made with the svg-mode-line-themes toolkit from Sabof.
;; https://github.com/sabof/svg-mode-line-themes
;;
;;; Code:

(require 'ocodo-smt-overrides)

(defvar ocodo-mesh-aqua:folder
  (file-name-directory (or load-file-name buffer-file-name)))

(defvar ocodo-mesh-aqua:images
  (concat ocodo-mesh-aqua:folder "images/"))

(defvar ocodo-mesh-aqua:fileurl-prefix
  (concat "file://" ocodo-mesh-aqua:folder))

(defvar ocodo-mesh-aqua:graphic
   (concat (ocodo-smt:string-from-file
            (concat ocodo-mesh-aqua:images "mesh-aqua.svg"))))

(smt/defrow ocodo-mesh-aqua:smt-left
  :margin 5
  :always-visible t
  :widgets '(buffer-info buffer-name buffer-dirty)
  :align "left")

(smt/defrow ocodo-mesh-aqua:smt-right
  :margin 6
  :always-visible t
  :widgets '(position-info)
  :align "right")

(smt/defrow ocodo-mesh-aqua:smt-mid
  :margin 25
  :always-visible t
  :widgets '(major-mode version-control minor-modes)
  :align "right")

(defun ocodo-mesh-aqua:smt/background (theme)
  (ocodo:smt/edge-svg theme (concat ocodo-mesh-aqua:graphic)))

(defun ocodo-mesh-aqua:smt/overlay (theme)
  (ocodo:smt/overlay theme))

(defun smt/ocodo-mesh-aqua-buffer-name-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#FFFFFF" "#666666")))

(defun smt/ocodo-mesh-aqua-major-mode-style (widget)
  (list :font-weight "normal"
        :font-size "10pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#AAAAAA" "#666666")))

(defun smt/ocodo-mesh-aqua-info-style (widget)
  (list :font-weight "normal"
        :font-size "6pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#999999" "#555555")))

(defun smt/ocodo-mesh-aqua-position-info-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :fill (if (smt/window-active-p) "#DDDDDD" "#999999")))

(defun smt/ocodo-mesh-aqua-dirty-style (widget)
  (list :font-weight "normal"
        :font-size "11pt"
        :font-family "sans-serif"
        :fill (if (and (or buffer-file-name buffer-offer-save) (buffer-modified-p))
                  ;; Dirty
                  (if (smt/window-active-p) "#FF6060" "#763030")
                ;; Untouched
                (if (smt/window-active-p) "#1F4F25" "#143519"))))

(defun smt/ocodo-mesh-aqua-minor-mode-style (widget)
  (list :font-weight "normal"
        :font-size "6pt"
        :fill (if (smt/window-active-p) "#FFFFFF" "#666666")))

(defun smt/ocodo-mesh-aqua-version-control-style (widget)
  (list :font-weight "normal"
        :font-size "8pt"
        :font-family "sans-serif"
        :fill (if (smt/window-active-p) "#60ACB1" "#365E63")))

(smt/deftheme ocodo-mesh-aqua:smt
  :pixel-height 26
  :background 'ocodo-mesh-aqua:smt/background
  :overlay    'ocodo-mesh-aqua:smt/overlay
  :local-widgets
  ;;; Note order of widgets are determined by smt/defrows above.
  (list (cons 'major-mode
              (smt/make-widget
               :prototype 'major-mode
               :style 'smt/ocodo-mesh-aqua-major-mode-style))

        (cons 'minor-modes
              (smt/make-widget
               :prototype 'minor-modes
               :style 'smt/ocodo-mesh-aqua-minor-mode-style))

        (cons 'version-control
              (smt/make-widget
               :prototype 'version-control
               :style 'smt/ocodo-mesh-aqua-version-control-style))

        (cons 'position-info
              (smt/make-widget
               :prototype 'position-info
               :style 'smt/ocodo-mesh-aqua-position-info-style))

        (cons 'buffer-info
              (smt/make-widget
               :prototype 'buffer-info
               :style 'smt/ocodo-mesh-aqua-info-style))

        (cons 'buffer-dirty
              (smt/make-widget
               :prototype 'buffer-dirty
               :style 'smt/ocodo-mesh-aqua-dirty-style))

        (cons 'buffer-name
              (smt/make-widget
               :prototype 'buffer-name
               :style 'smt/ocodo-mesh-aqua-buffer-name-style)))

  :rows (list 'ocodo-mesh-aqua:smt-left 'ocodo-mesh-aqua:smt-right 'ocodo-mesh-aqua:smt-mid))

(ocodo:smt/setup 17 "Menlo")

(provide 'ocodo-mesh-aqua-smt)

;; Hi-lock: (("(\\(smt/[^ ]*\\)" (1 ' font-lock-keyword-face append)))
;; Hi-lock: end
;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; eval: (hi-lock-mode)
;; End:

;;; ocodo-mesh-aqua-smt.el ends here
