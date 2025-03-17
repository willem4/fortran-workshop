module m_logging_factory
   implicit none(type, external)

   type, abstract :: t_logger
      logical :: debug
      logical :: quiet
      logical :: should_log_to_file
      integer :: log_file
   end type
   
   
   
end module m_logging_factory
