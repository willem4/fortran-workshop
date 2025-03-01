module test_hello_world
   use testdrive, only: new_unittest, unittest_type, error_type, check, test_failed
   use m_hello_world, only: hello_world
   implicit none
   private

   public :: collect_hello_world_tests

contains

   subroutine collect_hello_world_tests(testsuite)
      type(unittest_type), allocatable, intent(out) :: testsuite(:)

      testsuite = [ &
                  new_unittest("valid", test_valid), &
                  new_unittest("hello_world", test_hello_world_function), &
                  new_unittest("invalid", test_invalid, should_fail=.true.) &
                  ]

   end subroutine collect_hello_world_tests

   subroutine test_valid(error)
      type(error_type), allocatable, intent(out) :: error
      call check(error, 1 + 2 == 3)
      if (allocated(error)) return

      call check(error, 1 + 2, 3)
      if (allocated(error)) return
   end subroutine test_valid

   subroutine test_hello_world_function(error)
      type(error_type), allocatable, intent(out) :: error

      call check(error, hello_world(), 'Hello, world!')
      if (allocated(error)) return
   end subroutine test_hello_world_function

   subroutine test_invalid(error)
      type(error_type), allocatable, intent(out) :: error
      call test_failed(error, "Custom check failed", "Additional context")
      return
   end subroutine test_invalid

end module test_hello_world
