(prelude-require-packages '(pyenv-mode pytest))
(require 'pyenv-mode)
(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (message "Pyenv looking for virtualenv  %s!" project)
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(message "Adding hook on projectile-switch-project")
(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)


(add-hook 'python-mode-hook
          (lambda ()
            "Pytest hooks"
            (local-set-key "\C-ca" 'pytest-all)
            (local-set-key "\C-cm" 'pytest-module)
            (local-set-key "\C-c." 'pytest-one)
            (local-set-key "\C-cd" 'pytest-directory)
            (local-set-key "\C-cpa" 'pytest-pdb-all)
            (local-set-key "\C-cpm" 'pytest-pdb-module)
            (local-set-key "\C-cp." 'pytest-pdb-one)))
