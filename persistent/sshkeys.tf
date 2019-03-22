resource "hcloud_ssh_key" "gidsi_scraps" {
  name = "gidsi_scraps"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCy4zgAPO3ZP6Jlkbo3gXJ1WdzxMuNPGJPidrie1/9njpp7llSOEa2SKaY3a44CAOdliH99bTQ8X9FilidEjbELen/HPeLvb00jnhoQqS7vWcwun1LMJ7RUtX5Mrewl83HQGOKf5KnT2PybQvix0zyzyAfIgQfx1mCl0/MzY7PIXeHZCcUwbQFGQnNg8FQK7URT4qVaNvY9mgfFhoPMqnG95+nRm8se8kTzcVKPaDYZG6CwG00lk1Klmn4bgZ+4JtuJ/uYU1puTIJBI+N4JoKOrw9MQZROzf4ERKb5G6bWrTZ0aPPjzL1du9uOtr/FBZZdW0Mtlrlr5s64FjI2P0tAvruVwNIk7rCQsp7RCg/M2fsSaL3Z7oKbGaY/UlcLCq8vsJyUvxYlgueDn6d15y5gxHJnnwqUF4NOhYA1O9/RCQKX/ADZsh3lTHjeXhIkvSU1YuIJEHn9TMfL5nnw+KRXTsuePLuWHOvYhij4w6IRMXGpth8xxH8Q1qGUWjRzhZtDdj37aGijBc42c7LfXbJg4RX1ya/UMRmxTCSKUOhnvbLwTLQpbCQ08iUBAy7RibTUp3nkRk+HsHmvy/I4o3Fb32MAC2LU6yRhqlAzUx8I/iSCbTBQ7NwadBmCmXJYvuh7gq0iR6au1R0kUYTQgasW0Z2VUzvImAvUaFaDWTfd8vQ== gidsi@scraps"
}

output "ssh key id" {
  value = "${hcloud_ssh_key.gidsi_scraps.id}"
}