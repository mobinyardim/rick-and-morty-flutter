import 'package:rick_and_morty_flutter/converters/base_converter.dart';
import 'package:rick_and_morty_flutter/models/result.dart';
import 'package:rick_and_morty_flutter/remote_sources/dto/response_dto.dart';

class ResponseConverter<DomainT, DtoT>
    extends BaseConverter<Result<DomainT>, ResponseDto<DtoT>> {
  final BaseConverter<DomainT, DtoT> dataConverter;

  const ResponseConverter({required this.dataConverter});

  @override
  Result<DomainT> toDomain(ResponseDto<DtoT> dto) {
    return Result(
        info: Info(
            count: dto.info.count,
            pages: dto.info.pages,
            next: dto.info.next,
            prev: dto.info.prev),
        results: dto.results.map((e) => dataConverter.toDomain(e)).toList());
  }

  @override
  ResponseDto<DtoT> toDto(Result<DomainT> domain) {
    // TODO: implement toDto
    throw UnimplementedError();
  }
}
