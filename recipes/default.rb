#
# Cookbook: grub
#
# Copyright (c) 2016 Bloomberg L.P., All Rights Reserved.
#
#
grub node['grub']['service_name'] do |r|
  node['grub']['config'].each_pair { |k, v| r.send(k, v) }
  path '/tmp/mygrub.conf'
end

grub_item 'Red Hat Enterprise Linux Server (2.6.32-504.16.2.el6.x86_64)' do
  root '(hd0,0)'
  kernel '/vmlinuz-2.6.32-504.16.2.el6.x86_64'
  options(
    ro: true,
    root: '/dev/mapper/vg00-rootvol',
    elevator: 'deadline',
    crashkernel: '512M-16G:128M,16G-256G:256M,256G-:384M'
  )
  initrd '/initramfs-2.6.32-504.16.2.el6.x86_64.img'
end

grub_item 'Red Hat Enterprise Linux 6 (2.6.32-504.el6.x86_64)' do
  root '(hd0,0)'
  kernel '/vmlinuz-2.6.32-504.el6.x86_64'
  options(
    ro: true,
    root: '/dev/mapper/vg00-rootvol',
    elevator: 'deadline',
    crashkernel: '512M-16G:128M,16G-256G:256M,256G-:384M'
  )
  initrd '/initramfs-2.6.32-504.el6.x86_64.img'
end
