<div>
    @if ($paginator->hasPages())
    @php
    $pageInfo=$paginator->toArray(); 
    //    echo '<pre>';
    //    print_r($pageInfo);
    //    echo '</pre>';
    @endphp
        <nav>
            <ul class="pagination">
                {{-- Previous Page Link --}}
                @if ($paginator->onFirstPage())
                    <li class="page-item disabled" aria-disabled="true">
                        <span class="page-link">@lang('pagination.previous')</span>
                    </li>
                @else
                    <li class="page-item">
                        <button type="button" class="page-link" wire:click="previousPage" wire:loading.attr="disabled" rel="prev">@lang('pagination.previous')</button>
                    </li>
                @endif

                <li class="page-item disabled"><span class="page-link">Go to Page</span></li>
                <li class="page-item">                    
                    <select class="form-control">
                        @for ($i = 1; $i <= $pageInfo['last_page']; $i++)
                            <option value={{$i}} {{($i==$pageInfo['current_page'])?'selected':''}} wire:click="gotoPage({{$i}})">{{$i}}</option>
                        @endfor
                    </select>
                    
                </li>

                {{-- Next Page Link --}}
                @if ($paginator->hasMorePages())
                    <li class="page-item">
                        <button type="button" class="page-link" wire:click="nextPage" wire:loading.attr="disabled" rel="next">@lang('pagination.next')</button>
                    </li>
                @else
                    <li class="page-item disabled" aria-disabled="true">
                        <span class="page-link">@lang('pagination.next')</span>
                    </li>
                @endif
            </ul>
        </nav>
    @endif
</div>
