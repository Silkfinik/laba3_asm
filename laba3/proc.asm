.386

PUBLIC _modifyArray1@12
PUBLIC _modifyArray2
PUBLIC modifyArray3
PUBLIC modifyArray4
PUBLIC @modifyArray5@8

.model flat
.data
.code

_modifyArray1@12 proc
	push ebp 
	mov ebp, esp
	mov ebx, [ebp + 8] ; ebx = *arr[0]
	mov edx, [ebp + 12] ; edx = size_arr
	mov ecx, [ebp + 16] ; ecx = num
	mov eax, [ebx] ; eax = arr[0]
	cmp edx, 1 
	je add_one
	dec edx ; edx = size_arr -1 
	xor esi, esi ; arr index counter = 0

	cmp eax, [ebx + 4 * edx] ; compare arr[0] and arr[size_arr - 1]
	jl inc_arr
	jg dec_arr
	je equal_arr


	add_one :
		mov[ebx + 4], ecx
		jmp done

	inc_arr :
		mov edx, esi
		inc esi
		cmp edx, [ebp + 12]
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jg inc_arr
		jmp insert_num

	dec_arr :
		mov edx, esi
		inc esi
		cmp edx, [ebp + 12]
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jl dec_arr
		jmp insert_num

	insert_num :
		mov edx, esi
		dec edx
		mov eax, [ebx + 4 * edx]
		mov [ebx + 4 * edx], ecx
		mov ecx, eax
		inc esi
		cmp edx, [ebp + 12]
		jle insert_num
		jmp done

	equal_arr :
		mov edx, [ebp + 12]
		mov[ebx + 4 * edx], ecx
		jmp done

	done :
	mov esp,ebp
	pop ebp
	ret 12
_modifyArray1@12 endp

;**************************************************

_modifyArray2 proc
	push ebp 
	mov ebp, esp
	mov ebx, [ebp + 8] ; ebx = *arr[0]
	mov edx, [ebp + 12] ; edx = size_arr
	mov ecx, [ebp + 16] ; ecx = num
	mov eax, [ebx] ; eax = arr[0]
	cmp edx, 1 
	je add_one
	dec edx ; edx = size_arr -1 
	xor esi, esi ; arr index counter = 0

	cmp eax, [ebx + 4 * edx] ; compare arr[0] and arr[size_arr - 1]
	jl inc_arr
	jg dec_arr
	je equal_arr


	add_one :
		mov[ebx + 4], ecx
		jmp done

	inc_arr :
		mov edx, esi
		inc esi
		cmp edx, [ebp + 12]
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jg inc_arr
		jmp insert_num

	dec_arr :
		mov edx, esi
		inc esi
		cmp edx, [ebp + 12]
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jl dec_arr
		jmp insert_num

	insert_num :
		mov edx, esi
		dec edx
		mov eax, [ebx + 4 * edx]
		mov [ebx + 4 * edx], ecx
		mov ecx, eax
		inc esi
		cmp edx, [ebp + 12]
		jle insert_num
		jmp done

	equal_arr :
		mov edx, [ebp + 12]
		mov[ebx + 4 * edx], ecx
		jmp done

	done :
	mov esp,ebp
	pop ebp
	ret 
_modifyArray2 endp

;**************************************************

modifyArray3 proc stdcall, arr: dword, size_arr: dword, num:dword
	mov ebx, arr ; ebx = *arr[0]
	mov edx, size_arr ; edx = size_arr
	mov ecx, num ; ecx = num
	mov eax, [ebx] ; eax = arr[0]
	cmp edx, 1 
	je add_one
	dec edx ; edx = size_arr -1 
	xor esi, esi ; arr index counter = 0

cmp eax, [ebx + 4 * edx] ; compare arr[0] and arr[size_arr - 1]
	jl inc_arr
	jg dec_arr
	je equal_arr


	add_one :
		mov[ebx + 4], ecx
		jmp done

	inc_arr :
		mov edx, esi
		inc esi
		cmp edx, size_arr
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jg inc_arr
		jmp insert_num

	dec_arr :
		mov edx, esi
		inc esi
		cmp edx, size_arr
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jl dec_arr
		jmp insert_num

	insert_num :
		mov edx, esi
		dec edx
		mov eax, [ebx + 4 * edx]
		mov [ebx + 4 * edx], ecx
		mov ecx, eax
		inc esi
		cmp edx, size_arr
		jle insert_num
		jmp done

	equal_arr :
		mov edx, size_arr
		mov[ebx + 4 * edx], ecx
		jmp done

	done :
		ret 12
modifyArray3 endp

;************************************************

modifyArray4 proc C, arr: dword, size_arr: dword, num:dword
	mov ebx, arr ; ebx = *arr[0]
	mov edx, size_arr ; edx = size_arr
	mov ecx, num ; ecx = num
	mov eax, [ebx] ; eax = arr[0]
	cmp edx, 1 
	je add_one
	dec edx ; edx = size_arr -1 
	xor esi, esi ; arr index counter = 0

cmp eax, [ebx + 4 * edx] ; compare arr[0] and arr[size_arr - 1]
	jl inc_arr
	jg dec_arr
	je equal_arr


	add_one :
		mov[ebx + 4], ecx
		jmp done

	inc_arr :
		mov edx, esi
		inc esi
		cmp edx, size_arr
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jg inc_arr
		jmp insert_num

	dec_arr :
		mov edx, esi
		inc esi
		cmp edx, size_arr
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jl dec_arr
		jmp insert_num

	insert_num :
		mov edx, esi
		dec edx
		mov eax, [ebx + 4 * edx]
		mov [ebx + 4 * edx], ecx
		mov ecx, eax
		inc esi
		cmp edx, size_arr
		jle insert_num
		jmp done

	equal_arr :
		mov edx, size_arr
		mov[ebx + 4 * edx], ecx
		jmp done

	done :
		ret
modifyArray4 endp

;**********************************************

@modifyArray5@8 proc

	mov ebx, ecx ; ebx = *arr[0]
	mov ecx, edx
	mov edx, 3
	mov eax, [ebx] ; eax = arr[0]
	cmp edx, 1 
	je add_one
	dec edx ; edx = size_arr -1 
	xor esi, esi ; arr index counter = 0

	cmp eax, [ebx + 4 * edx] ; compare arr[0] and arr[size_arr - 1]
	jl inc_arr
	jg dec_arr
	je equal_arr


	add_one :
		mov[ebx + 4], ecx
		jmp done

	inc_arr :
		mov edx, esi
		inc esi
		cmp edx, 3
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jg inc_arr
		jmp insert_num

	dec_arr :
		mov edx, esi
		inc esi
		cmp edx, 3
		je equal_arr
		cmp ecx, [ebx + 4 * edx]
		jl dec_arr
		jmp insert_num

	insert_num :
		mov edx, esi
		dec edx
		mov eax, [ebx + 4 * edx]
		mov [ebx + 4 * edx], ecx
		mov ecx, eax
		inc esi
		cmp edx, 3
		jle insert_num
		jmp done

	equal_arr :
		mov edx, 3
		mov[ebx + 4 * edx], ecx
		jmp done

	done :
		ret

@modifyArray5@8 endp

end