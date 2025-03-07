program example
   use m_logging, only: init_logging, t_abstract_logger, t_do_everything_logger

   implicit none

   ! Depend on the abstract logger
   class(t_abstract_logger), allocatable :: logger

   call init_logging()

   ! Instantiate the concrete logger
   logger = t_do_everything_logger()

   call logger%log('[config] Loaded')

end program example
