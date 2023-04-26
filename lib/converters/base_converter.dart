abstract class BaseConverter<Domain, Dto> {

  const BaseConverter();
  Domain toDomain(Dto dto);

  Dto toDto(Domain domain);
}
