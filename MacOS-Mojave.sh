wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 268tKkixRMBBxHKeBCpS6s72ohm_7UvxkT4VkysGcyKi2JpZN
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
wget -O MyDisk.qcow2 https://vagrantcloud-files-production.s3-accelerate.amazonaws.com/archivist/boxes/36b16d9b-7020-49f5-a77a-18a2f4c30451?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA6NDPRW4BTTRKPJSQ%2F20220523%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220523T075007Z&X-Amz-Expires=900&X-Amz-Security-Token=FwoGZXIvYXdzEIH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDFBADRDSRHzt6NrwTCK3AZeVuM%2FbTSB3wblWnyHY2qJAKzUN3qst70P2kE%2B%2FTDOyomHl1EagZNx44cGOzF6b5IONqUXUvKOtJJyxKy0XV2cdXLMHO0TEsPV00DKh%2FX1K5eO%2BMtAOCE8yNT40waFy08%2BuTwiH%2BPuXyH0kwSKZCWFcD0IxBKyv5%2FfmbBErigPgxd%2FmuvERROkng%2BUnhXjuzzXsvp7P4UEZ3nLEQNAN7bpdD5fRr0ZSEo1jtCSLLZU7bqJGdAmh%2BijB8qyUBjItWclTlNjImRP33oQNEHAHNSHPJUa4Csc8ZsX00hsnFEYRI2nhw35ajCf4BCmm&X-Amz-SignedHeaders=host&X-Amz-Signature=f5197fb3f9888d24db0d5d6795b878268022f96ca6aa8c1800054380976dc8dc
clear
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=c \
  -drive file= MyDisk.qcow2,format=raw,if=virtio \
  -drive file=virtio-win.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -smp cores=2 \
