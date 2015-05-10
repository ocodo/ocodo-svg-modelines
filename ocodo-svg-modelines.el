;;; ocodo-svg-modelines --- a collection of beautiful, modern SVG modelines
;;
;; Author: ocodo <what.is.ocodo@gmail.com>
;; Package-Requires: ((svg-mode-line-themes))
;; Version: 0.1.0
;; URL: https://github.com/ocodo/ocodo-svg-modelines
;;
;;; Commentary:
;;
;; # Ocodo SVG modelines
;;
;; A completely superfluous, but otherwise most excellent collection
;; of awesome modelines... if not now, then at some point in the
;; future, you might want, need and maybe even love these.
;;
;; <sub>Don't worry if this isn't true, it's just promotional bullshit.</sub>
;;
;; Very much a work in progress, these modelines are relatively
;; sparse, however, any info or widgets you'd like to have, please
;; post an issue on the github repository
;; https://github.com/ocodo/ocodo-svg-modelines/issues and I'll
;; attempt to cater to you.
;;
;; ## What have I got for you so far?
;;
;; Each modeline currently features
;;
;; - file state (rw/ro)
;; - buffer filename
;; - saved/unsaved state
;; - Major mode
;; - VC/Git branch
;; - Minor modes (filtered)
;; - line:col
;; - vertical position percentage
;; - file size
;;
;; See roadmap for a few ideas on the direction of the project...
;;
;; Anyway, without further ado, aside from this droning preamble, here's the
;; modeline designs I have for you so far.
;;
;; ### ocodo-kawaii-light:smt
;;
;; ![](screenshots/ocodo-kawaii-light-smt.png)
;;
;; ### ocodo-minimal-light:smt
;;
;; ![](screenshots/ocodo-minimal-light-smt.png)
;;
;; ### ocodo-minimal-dark:smt
;;
;; ![](screenshots/ocodo-minimal-dark-smt.png)
;;
;; ### ocodo-mesh-grass:smt
;;
;; ![](screenshots/ocodo-mesh-grass-smt.png)
;;
;; ### ocodo-mesh-aqua:smt
;;
;; ![](screenshots/ocodo-mesh-aqua-smt.png)
;;
;; ### ocodo-steps-grass:smt
;;
;; ![](screenshots/ocodo-steps-grass-smt.png)
;;
;; ### ocodo-steps-aqua:smt
;;
;; ![](screenshots/ocodo-steps-aqua-smt.png)
;;
;; ## Roadmap
;;
;; Direction partly depends on community feedback, however I have my own
;; desires and wishes for this project, obviously. Top of my list is
;; minor and major mode displays being more graphical, although I think
;; these will be more experimental.
;;
;; I'd like to see an icon which describes the Major mode, and minor modes.
;;
;; Also:
;;
;; - Time would be nice to see as an analog graphical clock icon, which is relatively easy to achieve.
;;
;; - Date shown as a calendar page icon.
;;
;; - Version control state of the file shown graphically (some experimental stuff exists for this already.)
;;
;; - File file state info shown graphically (saved/unsaved changes are already shown by a splat and a checkmark)
;;
;; - I'm sure you can think of plenty more.
;;
;; ## Installation
;;
;; Manual installation is necessary at the moment. Package installation
;; via MELPA will be available soon (a few days from now: 2015-05-10
;; 8:55AM UTC+0800)
;;
;; Follow these steps:
;;
;;    wget https://github.com/ocodo/ocodo-svg-modelines/archive/0.1.0.tar.gz
;;    gunzip 0.1.0.tar.gz
;;    mv 0.1.0.tar ~/ocodo-svg-modelines-0.1.0.tar
;;
;; Subsequently, from Emacs:
;;
;;     M-x package-install <RET> svg-mode-line-themes
;;     M-x package-install-file <RET> ~/ocodo-svg-modelines-0.1.0.tar
;;
;; ## Usage
;;
;;     M-x ocodo-svg-modelines/init
;;
;;     M-x smt/set-theme
;;
;; You can then select one of the ocodo themes listed above.
;;
;; ## Caveat Emptor
;;
;; Please note this package is quite experimental and full SVG
;; functionality isn't available on all Emacs builds.
;;
;; If you are on OS X, I recommend you use the Emacs Mac Port build, it
;; is available via `brew`. It uses webkit to render SVG, so SVG support
;; is first class.
;;
;;     brew tap railwaycat/emacsmacport
;;     brew install emacs-mac
;;
;; Visit https://github.com/railwaycat/homebrew-emacsmacport for more info.
;;
;; On Linux and other *nix, build Emacs 25.x from source (Emacs git HEAD
;; from savannah.) librsvg support should include loading external
;; resources in SVG, which is used by these modelines. (older versions do
;; not support external resource loading.)
;;
;; ## Problems or Suggestions
;;
;; If you have problems using these modelines, please check the issues at
;; https://github.com/ocodo/ocodo-svg-modelines/issues and post a new one
;; as needed.  I will do my best to get fixes and help to you.
;;
;; If you have feature requests or other suggestions, or if you plain
;; don't like this package, please go ahead and post issues too.
;;
;; ## Forks and Contributions
;;
;; If you would like to make your own svg modelines using these as a
;; base, please go ahead and fork it, strip out the ocodo modelines if
;; you're going to publish.
;;
;; Contributions are very welcome, please go ahead, fork, branch and pull
;; request anything you'd like to add.
;;
;; ## Additions to the smt core
;;
;; This package relies on Sabof's svg-mode-line-themes.  Core
;; functionality for these themes is developed there.
;;
;; https://github.com/sabof/svg-mode-line-themes
;;
;; License: GNU GPL, see LICENCE file in this package for details.
;;
;;; Code:

(require 'svg-mode-line-themes)

;;;###autoload
(defun ocodo-svg-modelines/init ()
  "Initialize Ocodo's SVG Modeline collection."
  (interactive)
  (when (image-type-available-p 'svg)
    (smt/enable)
    (require 'ocodo-kawaii-light-smt)
    (require 'ocodo-minimal-light-smt)
    (require 'ocodo-minimal-dark-smt)
    (require 'ocodo-steps-aqua-smt)
    (require 'ocodo-steps-grass-smt)
    (require 'ocodo-mesh-aqua-smt)
    (require 'ocodo-mesh-grass-smt)))

(provide 'ocodo-svg-modelines)

;;; ocodo-svg-modelines.el ends here
