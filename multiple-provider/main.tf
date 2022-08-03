resource "local_file" "my-test-file" {
    filename = var.test-filename
    content = var.my-pet-filename
    #content = "This is a test file used to test local file provider. This file is created at "${time_static.my-time-stamp.id}""
}

resource "random_pet" "my-pet" {
   length = var.length
   separator = var.separator
   prefix = var.prefix
}

resource "local_file" "my-pet-name" {
   filename= var.my-pet-filename
   content = var.my-pet-content
   #content = "My pet is ${random_pet.my-pet.id}"
}

resource "time_static" "my-time-stamp" {

}