import os
import xml.etree.ElementTree as ET
from PIL import Image
import torch.utils.data as data
import torchvision.transforms as transforms
import torch
from torchvision.transforms import ToTensor
from torchvision.transforms import Resize

class CustomDataset(data.Dataset):
    def __init__(self, image_dir, annotation_dir, classes=["inventory","inventory_test"], crop_size=224):
        self.classes = classes
        self.image_dir = image_dir
        self.annotation_dir = annotation_dir
        self.img_files = os.listdir(os.path.join(image_dir))
        self.xml_files = os.listdir(os.path.join(annotation_dir))
        self.crop_size = crop_size
        self.transforms = transforms.Compose([
            transforms.RandomCrop(crop_size),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
        ])

    def __len__(self):
        return len(self.img_files)

    def __getitem__(self, index):
        img_file = self.img_files[index]
        xml_file = self.xml_files[index]

        img_path = os.path.join(self.image_dir, img_file)
        xml_path = os.path.join(self.annotation_dir, xml_file)

        img = Image.open(img_path).convert("RGB")
        tree = ET.parse(xml_path)
        root = tree.getroot()

        image = self.transforms(img)

        boxes = []
        labels = []
        for obj in root.iter("object"):
            label = obj.find("name").text
            bbox = obj.find("bndbox")
            xmin = float(bbox.find("xmin").text)
            ymin = float(bbox.find("ymin").text)
            xmax = float(bbox.find("xmax").text)
            ymax = float(bbox.find("ymax").text)
            boxes.append([xmin, ymin, xmax, ymax])
            labels.append(label)

        if not boxes:  # if there are no objects in the image
            boxes = torch.empty((0, 4), dtype=torch.float32)
            labels = torch.empty((0,), dtype=torch.int64)
        else:
            boxes = torch.tensor(boxes, dtype=torch.float32).squeeze()
            labels = torch.tensor([self.classes.index(c) for c in labels], dtype=torch.int64).squeeze()
            # Apply the ToTensor transform to the image
        fixed_size = (224, 224)

        img = Resize(fixed_size)(img)
        img = ToTensor()(img)
        targets = {
                'boxes': boxes,
                'labels': labels
                }

        # Wrap the single dictionary inside a list
        return img, [targets]

      




