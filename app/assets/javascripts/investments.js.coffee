jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#investment_background_image_cropbox').Jcrop
      setSelect: [0, 0, 200, 200]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#investment_background_image_crop_x').val(coords.x)
    $('#investment_background_image_crop_y').val(coords.y)
    $('#investment_background_image_crop_w').val(coords.w)
    $('#investment_background_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#investment_background_image_previewbox').css
      width: Math.round(100/coords.w * $('#investment_background_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#investment_background_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
