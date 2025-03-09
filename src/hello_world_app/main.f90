program hello_world_program
   use m_hello_world, only: hello_world

   implicit none(type, external)

   print *, hello_world()

end program hello_world_program
