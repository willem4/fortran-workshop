module test_vector_lib
   use testdrive, only: new_unittest, unittest_type, error_type, check, test_failed
   use m_vector, only: add_vectors, equal_vectors, vector3d

   implicit none(type, external)

   private

   public :: collect_tests

contains

   subroutine collect_tests(testsuite)
      type(unittest_type), allocatable, intent(out) :: testsuite(:)

      testsuite = [ &
                  new_unittest("test_add_vectors", test_add_vectors) &
                  ]

   end subroutine collect_tests

   subroutine test_add_vectors(error)
      type(error_type), allocatable, intent(out) :: error
      logical :: res
      
      type(vector3d) :: a  
      type(vector3d) :: b
      type(vector3d) :: c
      
      a = vector3d([1, 1, 1])
      b = vector3d([2, 2, 2])
      c = vector3d([3, 3, 3])
            
      call check(error, equal_vectors(c, add_vectors(a,b)) )  !
      
   end subroutine test_add_vectors

end module test_vector_lib
