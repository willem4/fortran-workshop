program example
   use m_logging, only: t_abstract_logger, t_do_everything_logger, init

   implicit none(type, external)

   ! Depend on the abstract logger
   class(t_abstract_logger), allocatable :: logger

   ! call logger.init_logging()
   ! call init_logging()

   ! Instantiate the concrete logger
   logger = t_do_everything_logger()

   call logger%log('[config] Loaded')

end program example
