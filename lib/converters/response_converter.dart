import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/models/PagedData.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/paged_data_dto.dart';

class ResponseConverter<DomainT, DtoT>
    extends BaseConverter<PagedData<DomainT>, PagedDataDto<DtoT>> {
  final BaseConverter<DomainT, DtoT> dataConverter;

  const ResponseConverter({required this.dataConverter});

  @override
  PagedData<DomainT> toDomain(PagedDataDto<DtoT> dto) {
    return PagedData(
        info: Info(
            count: dto.info.count,
            pages: dto.info.pages,
            next: dto.info.next,
            prev: dto.info.prev),
        results: dto.results.map((e) => dataConverter.toDomain(e)).toList());
  }

  @override
  PagedDataDto<DtoT> toDto(PagedData<DomainT> domain) {
    // TODO: implement toDto
    throw UnimplementedError();
  }
}
