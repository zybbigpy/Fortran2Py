module example
    use iso_c_binding
    use, intrinsic :: iso_fortran_env
    use mpi

    implicit none
contains
    subroutine sqr_2d_arr(nd, val) BIND(C, NAME='sqr_2d_arr')
        !DEC$ ATTRIBUTES DLLEXPORT :: sqr_2d_arr
        integer, intent(in) :: nd
        integer, intent(inout) :: val(nd, nd)
        integer :: i, j
        do j = 1, nd
        do i = 1, nd
            val(i, j) = (val(i, j) + val(j, i)) ** 2
        enddo
        enddo
    end subroutine sqr_2d_arr

    subroutine mpi_hello() BIND(C, NAME='mpi_hello')

        integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)
        call MPI_INIT(ierror)
        call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
        call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
        print*, 'node', rank, ': Hello world'
        call MPI_FINALIZE(ierror)
        
    end subroutine mpi_hello

    subroutine x2y2(vec, vec2) BIND(C, NAME='x2y2')
        real(real64), intent(in) :: vec(3)
        real(real64), INTENT(INOUT) :: vec2(1)
        ! print *, vec(1)
        ! print *, vec(2)
        ! print *, vec2(1)
        vec2(1) = vec(1)**2 + vec(2)**2
        ! print *, vec2

    end subroutine x2y2
end module example