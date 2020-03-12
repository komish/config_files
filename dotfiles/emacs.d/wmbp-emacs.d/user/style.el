;; configure font
(set-default-font "roboto mono-15")

;; configure org levels
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
;; '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
;; '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
;; '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
