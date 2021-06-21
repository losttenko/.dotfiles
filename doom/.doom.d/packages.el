;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
(package! org-ref)
(package! elcord)

(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))

;; When using org-roam via the `+roam` flag
(unpin! org-roam)

;; When using bibtex-completion via the `biblio` module
(unpin! bibtex-completion helm-bibtex ivy-bibtex)

(package! calctex :recipe (:host github :repo "johnbcoughlin/calctex"
                           :files ("*.el" "calctex/*.el" "calctex-contrib/*.el" "org-calctex/*.el" "vendor"))
  :pin "784cf911bc96aac0f47d529e8cee96ebd7cc31c9")


(package! ess-view :pin "925cafd876e2cc37bc756bb7fcf3f34534b457e2") ;; dataframes

(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5") ;; nicer man pages


(package! calibredb :pin "a3b04c0c37b1e8ceff2472e21a3579e64e944528") ;; ebook library manager


(package! nov :pin "b3c7cc28e95fe25ce7b443e5f49e2e45360944a3") ;; ebook reader

;; latex auto snippets
(package! aas :recipe (:host github :repo "ymarco/auto-activating-snippets")
  :pin "3076cefea0f6ae9d7757f13c27b5602e007b58ec")
(package! laas :recipe (:local-repo "lisp/LaTeX-auto-activating-snippets"))

(package! org-super-agenda :pin "f5e80e4d0da6b2eeda9ba21e021838fa6a495376")

(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "67fc46c8a68989b932bce879fbaa62c6a2456a1f")

(package! org-pretty-table
  :recipe (:host github :repo "Fuco1/org-pretty-table") :pin "87772a9469d91770f87bfa788580fca69b9e697a")


;; superstar tags
(package! org-pretty-tags :pin "5c7521651b35ae9a7d3add4a66ae8cc176ae1c76")

;; latex fragment previews

(package! org-fragtog :pin "0151cabc7aa9f244f82e682b87713b344d780c23")

;; org formatting markers
(package! org-appear :recipe (:host github :repo "awth13/org-appear")
  :pin "6ee49875f8bdefafbde849f5628d673e9740cf8c")

;; syntax highligting on latex export
(package! engrave-faces :recipe (:host github :repo "tecosaur/engrave-faces"))

(package! ox-gfm :pin "99f93011b069e02b37c9660b8fcb45dab086a07f") ;; markdown export stuff


(package! org-ref :pin "3ca9beb744621f007d932deb8a4197467012c23a") ;; citations

(package! org-roam-server :pin "2122a61e9e9be205355c7e2c1e4b65986d6985a5")

(package! graphviz-dot-mode :pin "3642a0a5f41a80c8ecef7c6143d514200b80e194")

;;Declarative Org Capture Templates
(package! doct
  :recipe (:host github :repo "progfolio/doct")
  :pin "67fc46c8a68989b932bce879fbaa62c6a2456a1f")
