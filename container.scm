(use-modules (gnu)
             (gnu bootloader extlinux)
             (gnu packages base)
             (gnu packages certs)
             (gnu packages curl)
             (gnu packages ncurses)
             (gnu packages ssh)
             (gnu packages vim)
             (gnu services base)
             (guix gexp))

(operating-system
 (host-name "contained")
 (timezone "America/Los_Angeles")
 (locale "en_US.utf8")
 (locale-libcs (list glibc-2.28 (canonical-package glibc)))
 (initrd-modules %base-initrd-modules)
 (bootloader
  (bootloader-configuration
   (bootloader extlinux-bootloader)))
 (file-systems %base-file-systems)
 (users
  (cons (user-account
         (name "combinators")
         (group "users")
         (supplementary-groups '("wheel"))
         (home-directory "/home/combinators"))
        %base-user-accounts))
 (packages
  (cons*
   curl
   ncurses
   nss-certs
   openssh
   glibc-utf8-locales
   vim
   %base-packages))
 (services %base-services)
 (name-service-switch %mdns-host-lookup-nss))
